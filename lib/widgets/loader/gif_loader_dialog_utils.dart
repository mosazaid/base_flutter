import 'package:flutter/material.dart';

import 'gif_loader_container.dart';


class GifLoaderDialogUtils {
  static showMyDialog(BuildContext context) {
    showDialog(context: context, builder: (ctx) => GifLoaderContainer());
  }

  static hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
