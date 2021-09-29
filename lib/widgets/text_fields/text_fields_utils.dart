import 'package:flutter/material.dart';

class TextFieldsUtils {
  static BoxDecoration containerBorderDecoration(
      Color containerColor, Color borderColor,
      {double borderWidth = -1, double borderRadius = 12}) {
    return BoxDecoration(
      color: containerColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      border: Border.fromBorderSide(BorderSide(
        color: borderColor,
        width: borderWidth == -1 ? 2.0 : borderWidth,
      )),
    );
  }

  static InputDecoration textFieldSelectorDecoration(
      String hintText, String selectedText, bool isDropDown,
      {IconData suffixIcon,
      Color dropDownColor,
      bool hasBorder = true,
      Color underLineColor,
      IconButton obscureIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      counterText: '',
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: underLineColor ??
                (hasBorder ? Color(0Xffffffff) : Colors.grey[300])),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: underLineColor ??
                (hasBorder ? Color(0Xffffffff) : Colors.grey[300])),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: underLineColor ??
                (hasBorder ? Color(0Xffffffff) : Colors.grey[300])),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
            color: underLineColor ??
                (hasBorder ? Color(0Xffffffff) : Colors.grey[300])),
      ),
      /*focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),*/
      hintText: selectedText != null ? selectedText : hintText,
      suffixIcon: obscureIcon ??
          Icon(
            suffixIcon ?? null,
            color: Colors.grey.shade600,
          ),
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade600,
      ),
    );
  }
}
