import 'package:JordanElectricPowerCompany/widgets/dialog/AskPermissionDialog.dart';
import 'package:JordanElectricPowerCompany/widgets/transitions/slide_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AppPermissionsUtils {

  static requestVideoCallPermission({BuildContext context, String type,Function onTapGrant}) async {

    var cameraPermission = Permission.camera;
    var microphonePermission = Permission.microphone;
    PermissionStatus permissionCameraStatus = await cameraPermission.status;
    PermissionStatus permissionMicrophoneStatus = await microphonePermission.status;

    if (permissionCameraStatus.isPermanentlyDenied || permissionMicrophoneStatus.isPermanentlyDenied) {
      await _showPermissionDialog(context, type,onTapGrant);
    } else if (!permissionCameraStatus.isGranted || !permissionMicrophoneStatus.isGranted)  {
      permissionCameraStatus = await cameraPermission.request();
      permissionMicrophoneStatus = await microphonePermission.request();
      if (permissionCameraStatus.isDenied || permissionMicrophoneStatus.isDenied)
        await _showPermissionDialog(context, type,onTapGrant);
      else
      onTapGrant();
    } else if (permissionCameraStatus.isDenied || permissionMicrophoneStatus.isDenied)
      await _showPermissionDialog(context, type,onTapGrant);
    else
      onTapGrant();
  }

  static _showPermissionDialog(BuildContext context, String type,Function onTapGrant) async {
    Navigator.push(
        context, SlideUpPageRoute(widget: AskPermissionDialog(type: type,onTapGrant: onTapGrant,)));
  }

  static Future<bool> isVideoCallPermissionGranted() async {
    PermissionStatus permissionCameraStatus = await Permission.camera.status;
    PermissionStatus permissionMicrophoneStatus = await Permission.microphone.status;
    return permissionCameraStatus.isGranted && permissionMicrophoneStatus.isGranted;
  }
}
