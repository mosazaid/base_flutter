import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:JordanElectricPowerCompany/core/viewModel/project_view_model.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/text_field_error.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/text_fields_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app_texts_widget.dart';

class AppTextFieldCustom extends StatefulWidget {
  final double height;
  final Function onClick;
  final String hintText;
  final TextEditingController controller;
  final bool isTextFieldHasSuffix;
  final bool hasBorder;
  final String dropDownText;
  final IconButton suffixIcon;
  final Color dropDownColor;
  final Color underLineColor;
  final bool enabled;
  final TextInputType inputType;
  final TextAlign textAlign;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final Function(String) onChanged;
  final String validationError;
  final bool isPrscription;
  final bool canObscure;
  final TextInputAction textInputAction;

  AppTextFieldCustom({
    this.height = 0,
    this.onClick,
    this.hintText,
    this.controller,
    this.hasBorder = true,
    this.isTextFieldHasSuffix = false,
    this.dropDownText,
    this.suffixIcon,
    this.dropDownColor,
    this.underLineColor,
    this.enabled = true,
    this.inputType,
    this.textAlign,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters,
    this.onChanged,
    this.validationError,
    this.isPrscription = false,
    this.canObscure = false,
    this.textInputAction,
  });

  @override
  _AppTextFieldCustomState createState() => _AppTextFieldCustomState();
}

class _AppTextFieldCustomState extends State<AppTextFieldCustom> {
  bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    ProjectViewModel projectViewModel = Provider.of(context);

    return Column(
      children: [
        Container(
          height: widget.height != 0 && widget.maxLines == 1
              ? widget.height + 8
              : null,
          decoration: widget.hasBorder
              ? TextFieldsUtils.containerBorderDecoration(
                  Color(0Xffffffff),
                  widget.validationError == null
                      ? Color(0xFFEFEFEF)
                      : Colors.red.shade700)
              : !widget.hasBorder && widget.dropDownText != null
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: widget.underLineColor ??
                                  (widget.hasBorder
                                      ? Color(0Xffffffff)
                                      : Colors.grey[300]))))
                  : null,
          padding:
              EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
          child: InkWell(
            onTap: widget.onClick ?? null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: widget.dropDownText == null
                        ? EdgeInsets.symmetric(vertical: 0)
                        : EdgeInsets.symmetric(vertical: 0), // 8.0
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if ((widget.controller != null &&
                                widget.controller.text != "") ||
                            widget.dropDownText != null)
                          AppText(
                            widget.hintText,
                            color: Color(0xFF2E303A),
                            fontSize: widget.isPrscription == false
                                ? SizeConfig.textMultiplier * 1.3
                                : 0,
                            fontWeight: FontWeight.w700,
                          ),
                        widget.dropDownText == null
                            ? Container(
                                height:
                                    widget.height != 0 && widget.maxLines == 1
                                        ? widget.height - 22
                                        : null,
                                child: TextField(
                                  textAlign: widget.textAlign ??
                                      (projectViewModel.isArabic
                                          ? TextAlign.right
                                          : TextAlign.left),
                                  decoration: TextFieldsUtils
                                      .textFieldSelectorDecoration(
                                          widget.hintText, null, true,
                                          hasBorder: widget.hasBorder,
                                          obscureIcon: widget.canObscure
                                              ? IconButton(
                                                  icon: Icon(_isSecure
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isSecure = !_isSecure;
                                                    });
                                                  },
                                                )
                                              : null),
                                  style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 1.7,
                                    fontFamily: 'Poppins',
                                    color: AppGlobal.textColor,
                                  ),
                                  controller: widget.controller,
                                  keyboardType: widget.inputType ??
                                      (widget.maxLines == 1
                                          ? TextInputType.text
                                          : TextInputType.multiline),
                                  enabled: widget.enabled,
                                  minLines: widget.minLines,
                                  maxLines: widget.maxLines,
                                  inputFormatters:
                                      widget.inputFormatters != null
                                          ? widget.inputFormatters
                                          : [],
                                  onChanged: (value) {
                                    setState(() {});
                                    if (widget.onChanged != null) {
                                      widget.onChanged(value);
                                    }
                                  },
                                  obscureText:
                                      widget.canObscure ? _isSecure : false,
                                  textInputAction: widget.textInputAction,
                                ),
                              )
                            : Container(
                                child: AppText(
                                  widget.dropDownText,
                                  color: Color(0xFF575757),
                                  fontSize: SizeConfig.textMultiplier * 1.7,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                widget.isTextFieldHasSuffix
                    ? widget.suffixIcon != null
                        ? widget.suffixIcon
                        : InkWell(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: widget.dropDownColor != null
                                  ? widget.dropDownColor
                                  : Colors.black,
                            ),
                          )
                    : Container(),
              ],
            ),
          ),
        ),
        if (widget.validationError != null)
          TextFieldsError(error: widget.validationError),
      ],
    );
  }
}
