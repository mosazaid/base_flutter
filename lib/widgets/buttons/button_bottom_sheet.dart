import 'package:flutter/material.dart';

import 'app_buttons_widget.dart';

class ButtonBottomSheet extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String title;
  final IconData iconData;
  final Widget icon;
  final Color color;
  final double fontSize;
  final double padding;
  final Color fontColor;
  final bool loading;
  final bool disabled;
  final FontWeight fontWeight;
  final bool hasBorder;
  final Color borderColor;
  final double radius;
  final double vPadding;
  final double hPadding;

  ButtonBottomSheet({@required this.onPressed,
    this.title,
    this.iconData,
    this.icon,
    this.color,
    this.fontSize = 2,
    this.padding = 13,
    this.loading = false,
    this.disabled = false,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.vPadding = 0,
    this.hPadding = 0,
    this.radius = 8.0,
    this.hasBorder = false,
    this.borderColor,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          AppButton(
            title: title,
            onPressed: onPressed,
            fontWeight: fontWeight,
            color: color,
            fontSize: fontSize,
            padding: padding,
            disabled: disabled,
            radius: radius,
            hasBorder: hasBorder,
            fontColor: fontColor,
            icon: icon,
            iconData: iconData,
            hPadding: hPadding,
            vPadding: vPadding,
            borderColor: borderColor,
            loading: loading,
          ),
        ],
      ),
    );
  }
}
