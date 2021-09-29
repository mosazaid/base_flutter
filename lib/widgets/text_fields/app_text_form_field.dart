import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends FormField<String> {
  AppTextFormField(
      {FormFieldSetter<String> onSaved,
      String inputFormatter,
      FormFieldValidator<String> validator,
      ValueChanged<String> onChanged,
      GestureTapCallback onTap,
      bool obscureText = false,
      TextEditingController controller,
      bool autovalidate = true,
      TextInputType textInputType,
      String hintText,
      FocusNode focusNode,
      TextInputAction textInputAction=TextInputAction.done,
      ValueChanged<String> onFieldSubmitted,
      IconButton prefix,
      String labelText,
      IconData suffixIcon,
      bool readOnly = false,
      borderColor})
      : super(
            onSaved: onSaved,
            validator: validator,
            autovalidate: autovalidate,
            builder: (FormFieldState<String> state) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    child: TextFormField(
                      obscureText: obscureText,
                      focusNode: focusNode,
                      keyboardType: textInputType,
                      readOnly: readOnly,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(
                      //       RegExp(inputFormatter)),
                      // ],
                      onChanged: onChanged ??
                          (value) {
                            state.didChange(value);
                          },
                      textInputAction: textInputAction,
                      onFieldSubmitted: onFieldSubmitted,

                      decoration: InputDecoration(
                          hintText: hintText,
                          suffixIcon: prefix,
                          hintStyle: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          labelText: labelText,
                          labelStyle: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.7,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(
                                color: borderColor != null
                                    ? borderColor
                                    : Color(0xFFCCCCCC)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor != null
                                    ? borderColor
                                    : Color(0xFFCCCCCC)),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )
                          //BorderRadius.all(Radius.circular(20));
                          ),
                      onTap: onTap,
                      controller: controller,
                    ),
                  ),
                  state.hasError
                      ? Text(
                          state.errorText,
                          style: TextStyle(color: Colors.red),
                        )
                      : Container()
                ],
              );
            });
}
