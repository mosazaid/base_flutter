import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../app_texts_widget.dart';

class TextFieldsError extends StatelessWidget {
  const TextFieldsError({
    Key key,
    @required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
      child: Row(
        children: [
          Icon(
            EvaIcons.alertTriangle,
            size: 20,
            color: Colors.red.shade700,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: AppText(
              error,
              fontFamily: 'Poppins',
              fontSize: SizeConfig.textMultiplier * 1.7,
              color: Colors.red.shade700,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
