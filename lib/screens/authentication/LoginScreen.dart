import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/core/viewModel/AuthenticationViewModel.dart';
import 'package:JordanElectricPowerCompany/screens/authentication/ResetPasswordScreen.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/app-textfield-custom.dart';
import 'package:JordanElectricPowerCompany/widgets/transitions/fade_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationViewModel authenticationViewModel;

  TextEditingController jobNumberController = TextEditingController();
  String jobNumberError;
  TextEditingController passwordController = TextEditingController();
  String passwordError;

  @override
  void initState() {
    jobNumberController.text = "";
    passwordController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    jobNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authenticationViewModel = Provider.of<AuthenticationViewModel>(context);

    return AppScaffold(
      isShowAppBar: false,
      body: Container(
        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                child: Image.asset(
                  'assets/images/logo_wide.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          TranslationBase.of(context).login,
                          color: AppGlobal.appPrimaryColor,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        AppTextFieldCustom(
                          height: MediaQuery.of(context).size.height * 0.075,
                          maxLines: 1,
                          hintText: TranslationBase.of(context).jobNumber,
                          hasBorder: false,
                          validationError: jobNumberError,
                          controller: jobNumberController,
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        AppTextFieldCustom(
                          height: MediaQuery.of(context).size.height * 0.075,
                          maxLines: 1,
                          hintText: TranslationBase.of(context).password,
                          hasBorder: false,
                          validationError: passwordError,
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          canObscure: true,
                          textInputAction: TextInputAction.done,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadePage(
                                page: ResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              TranslationBase.of(context).forgetPassword,
                              color: Color(0xFF2E303A),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        AppButton(
                          title: TranslationBase.of(context).login,
                          onPressed: () {

                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              FadePage(
                                page: RegistrationScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: AppText(
                              TranslationBase.of(context).registerNewUser,
                              color: AppGlobal.appPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
