import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:JordanElectricPowerCompany/screens/authentication/ResetPasswordScreen2.dart';
import 'package:JordanElectricPowerCompany/utils/app_toast_msg.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/app-textfield-custom.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/text_fields_utils.dart';
import 'package:JordanElectricPowerCompany/widgets/transitions/fade_page.dart';
import 'package:flutter/material.dart';

import 'ConfirmationScreen.dart';

class AccountConfirmationScreen extends StatefulWidget {

  final bool isFromRegistration;

  const AccountConfirmationScreen({Key key, this.isFromRegistration = false}) : super(key: key);

  @override
  _AccountConfirmationScreenState createState() =>
      _AccountConfirmationScreenState();
}

class _AccountConfirmationScreenState extends State<AccountConfirmationScreen> {
  final verifyAccountForm = GlobalKey<FormState>();
  String digit1 = "", digit2 = "", digit3 = "", digit4 = "";
  final focusD1 = FocusNode();
  final focusD2 = FocusNode();
  final focusD3 = FocusNode();
  final focusD4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowAppBar: false,
      body: Container(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: AppText(
                          TranslationBase.of(context).accountConfirmation,
                          color: AppGlobal.appPrimaryColor,
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppText(
                        TranslationBase.of(context).accountConfirmationDesc,
                        color: AppGlobal.textColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Form(
                        key: verifyAccountForm,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConfirmationTextFieldWidget(
                                focus: focusD1,
                                focusNext: focusD2,
                                onChanged: (val) {
                                  digit1 = val;
                                  if (val.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focusD2);
                                  }
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ConfirmationTextFieldWidget(
                                focus: focusD2,
                                focusNext: focusD3,
                                onChanged: (val) {
                                  digit2 = val;
                                  if (val.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focusD3);
                                  }
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ConfirmationTextFieldWidget(
                                focus: focusD3,
                                focusNext: focusD4,
                                onChanged: (val) {
                                  digit3 = val;
                                  if (val.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focusD4);
                                  }
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ConfirmationTextFieldWidget(
                                focus: focusD4,
                                onChanged: (val) {
                                  digit4 = val;
                                  if (val.length == 1) {
                                    AppToastMsg.showShortToast("send otp");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            TranslationBase.of(context).reSendVerificationCode,
                            color: AppGlobal.appPrimaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          AppText(
                            "01:00",
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.w600,
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: AppButton(
                title: TranslationBase.of(context).confirm,
                onPressed: () {
                  AppToastMsg.showShortToast("$digit1$digit2$digit3$digit4");
                  Navigator.push(
                    context,
                    FadePage(
                      page: widget.isFromRegistration ? ConfirmationScreen(isFromRegistration: true,) : ResetPasswordScreen2(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationTextFieldWidget extends StatefulWidget {
  final FocusNode focus;
  final FocusNode focusNext;
  final Function(String) onChanged;

  const ConfirmationTextFieldWidget({
    Key key,
    this.focus,
    this.focusNext,
    this.onChanged,
  }) : super(key: key);

  @override
  _ConfirmationTextFieldWidgetState createState() =>
      _ConfirmationTextFieldWidgetState();
}

class _ConfirmationTextFieldWidgetState
    extends State<ConfirmationTextFieldWidget> {
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.2,
        child: TextFormField(
          textInputAction: (widget.focusNext != null)
              ? TextInputAction.next
              : TextInputAction.done,
          style: buildTextStyle(),
          autofocus: true,
          maxLength: 1,
          focusNode: widget.focus ?? null,
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: buildInputDecoration(context),
          onSaved: (val) {},
          validator: validateCodeDigit,
          onFieldSubmitted: (_) {
            if (widget.focusNext != null)
              FocusScope.of(context).requestFocus(widget.focusNext);
          },
          onChanged: (val) {
            widget.onChanged(val);
          },
        ),
      ),
    );
  }

  TextStyle buildTextStyle() {
    return TextStyle(
      fontSize: SizeConfig.textMultiplier * 3,
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      counterText: " ",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey[300]),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey[300]),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey[300]),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Theme.of(context).errorColor),
      ),
    );
  }

  String validateCodeDigit(value) {
    if (value.isEmpty) {
      return ' ';
    }
    /* else if (value.length == 3) {
      print(value);
    }*/
    else {
      return null;
    }
  }
}
