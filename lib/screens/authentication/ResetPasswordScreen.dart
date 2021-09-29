import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/app-textfield-custom.dart';
import 'package:JordanElectricPowerCompany/widgets/transitions/fade_page.dart';
import 'package:flutter/material.dart';

import 'AccountConfirmationScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController jobNumberController = TextEditingController();
  String jobNumberError;

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
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AppText(
                          TranslationBase.of(context).resetPassword,
                          color: AppGlobal.appPrimaryColor,
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).jobNumber,
                        hasBorder: false,
                        validationError: jobNumberError,
                        controller: jobNumberController,
                        inputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: AppButton(
                title: TranslationBase.of(context).next,
                onPressed: () {
                  if (jobNumberController.text.isEmpty) {
                    setState(() {
                      jobNumberError =
                          TranslationBase.of(context).requiredField;
                    });
                  } else {
                    setState(() {
                      jobNumberError = null;
                    });
                    Navigator.push(
                      context,
                      FadePage(
                        page: AccountConfirmationScreen(isFromRegistration: false,),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
