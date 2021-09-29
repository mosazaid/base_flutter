
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*class VideoChannel{
  /// channel name
  static const _channel = const MethodChannel("Dr.cloudSolution/videoCall");
  static  openVideoCallScreen({kApiKey, kSessionId, kToken, callDuration, warningDuration,int vcId,String tokenID,
    String generalId,int doctorId, String patientName, bool isRecording = false, Function() onCallEnd ,
    Function(SessionStatusModel sessionStatusModel) onCallNotRespond ,Function(String error) onFailure, VoidCallback onCallConnected, VoidCallback onCallDisconnected}) async {

    onCallConnected = onCallConnected ?? (){};
    onCallDisconnected = onCallDisconnected ?? (){};
    var result;
    try {
      _channel.setMethodCallHandler((call) {
        if(call.method == 'onCallConnected'){
          onCallConnected();
        }
        if(call.method == 'onCallDisconnected'){
          onCallDisconnected();
        }
        return true as dynamic;
      });

      result = await _channel.invokeMethod(
        'openVideoCall',
        {
          "kApiKey": kApiKey,
          "kSessionId": kSessionId,
          "kToken": kToken,
          "appLang": "en",
          "baseUrl": BASE_URL_LIVE_CARE,//TODO change it to live
          "VC_ID": vcId,
          "TokenID": tokenID,
          "generalId": generalId,
          "DoctorId": doctorId ,
          "patientName":  patientName,
          "isRecording":  isRecording,
        },
      );
      if(result['callResponse'] == 'CallEnd') {
        onCallEnd();
      }
      else {
        SessionStatusModel sessionStatusModel = SessionStatusModel.fromJson(Platform.isIOS ?result['sessionStatus'] :json.decode(result['sessionStatus']));
        onCallNotRespond(sessionStatusModel);
      }

    } catch (e) {
      onFailure(e.toString());
    }

  }


}*/
