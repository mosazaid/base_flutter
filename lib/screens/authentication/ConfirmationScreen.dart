import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final bool isFromRegistration;

  const ConfirmationScreen({Key key, this.isFromRegistration = false})
      : super(key: key);

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
                          isFromRegistration
                              ? TranslationBase.of(context).registerMsg
                              : TranslationBase.of(context).passwordChangedMsg,
                          color: AppGlobal.appPrimaryColor,
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AppText(
                        isFromRegistration
                            ? TranslationBase.of(context).registerMsgSuccess
                            : TranslationBase.of(context)
                                .passwordChangedMsgSuccess,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/login/checked.png',
                            fit: BoxFit.contain,
                          ),
                        ),
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
                    if (isFromRegistration) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
