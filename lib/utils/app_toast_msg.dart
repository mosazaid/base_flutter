import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class AppToastMsg {
  void showLongToast(msg) {
    FlutterFlexibleToast.showToast(
      message: msg,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showSuccesToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        icon: ICON.SUCCESS,
        fontSize: 16,
        imageSize: 35,
        textColor: Colors.white);
  }

  static void showErrorToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        icon: ICON.CLOSE,
        fontSize: 16,
        imageSize: 35,
        timeInSeconds: 912,
        textColor: Colors.white);
  }

  static void showShortToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_SHORT,
        icon: ICON.INFO,
        timeInSeconds: 1);
  }

  static void showTopShortToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.TOP,
        icon: ICON.WARNING,
        timeInSeconds: 1);
  }

  static void showCenterShortToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.CENTER,
        icon: ICON.WARNING,
        timeInSeconds: 1);
  }

  static void showCenterShortLoadingToast(msg) {
    FlutterFlexibleToast.showToast(
        message: msg,
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.BOTTOM,
        icon: ICON.LOADING,
        radius: 20,
        elevation: 10,
        textColor: Colors.white,

        timeInSeconds: 2);
  }

  static void cancelToast(msg) {
    FlutterFlexibleToast.cancel();
  }
}
