import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:JordanElectricPowerCompany/screens/authentication/AccountConfirmationScreen.dart';
import 'package:JordanElectricPowerCompany/utils/date-utils.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/dialog/ListSelectDialog.dart';
import 'package:JordanElectricPowerCompany/widgets/text_fields/app-textfield-custom.dart';
import 'package:JordanElectricPowerCompany/widgets/transitions/fade_page.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<dynamic> nationalityList;
  dynamic _nationality;
  List<dynamic> documentList;
  dynamic _selectedDocument;

  DateTime _birthdate;

  TextEditingController jobNumberController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController documentNumController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String jobNumberError;
  String nationalityError;
  String idError;
  String documentError;
  String documentNumberError;
  String birthdateError;
  String passwordError;
  String confirmPasswordError;
  String phoneError;
  String emailError;

  @override
  Widget build(BuildContext context) {
    nationalityList = [];
    dynamic jordan = {"id": 1, "name": "أردني"};
    dynamic other = {"id": 2, "name": "غير أردني"};
    nationalityList.add(jordan);
    nationalityList.add(other);

    documentList = [];
    dynamic doc1 = {"id": 1, "name": "وثيقة 1"};
    dynamic doc2 = {"id": 2, "name": "وثيقة 2"};
    dynamic doc3 = {"id": 3, "name": "وثيقة 3"};
    dynamic doc4 = {"id": 4, "name": "وثيقة 4"};
    documentList.add(doc1);
    documentList.add(doc2);
    documentList.add(doc3);
    documentList.add(doc4);

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
                          TranslationBase.of(context).registerNewUser,
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
                        textInputAction: TextInputAction.next,
                      ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).nationality,
                        dropDownText:
                            _nationality != null ? _nationality['name'] : null,
                        enabled: false,
                        isTextFieldHasSuffix: true,
                        hasBorder: false,
                        validationError: nationalityError,
                        onClick: () {
                          ListSelectDialog dialog = ListSelectDialog(
                            list: nationalityList,
                            attributeName: 'name',
                            attributeValueId: 'id',
                            okText: TranslationBase.of(context).ok,
                            okFunction: (selectedValue) {
                              setState(() {
                                _nationality = selectedValue;
                              });
                            },
                          );
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return dialog;
                            },
                          );
                        },
                      ),
                      if (_nationality == null || _nationality['id'] == 1)
                        AppTextFieldCustom(
                          height: MediaQuery.of(context).size.height * 0.075,
                          maxLines: 1,
                          hintText: TranslationBase.of(context).id,
                          hasBorder: false,
                          validationError: idError,
                          controller: idController,
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      if (_nationality != null && _nationality['id'] == 2)
                        AppTextFieldCustom(
                          height: MediaQuery.of(context).size.height * 0.075,
                          maxLines: 1,
                          hintText: TranslationBase.of(context).documentType,
                          dropDownText: _selectedDocument != null
                              ? _selectedDocument['name']
                              : null,
                          enabled: false,
                          isTextFieldHasSuffix: true,
                          hasBorder: false,
                          validationError: documentError,
                          onClick: () {
                            ListSelectDialog dialog = ListSelectDialog(
                              list: documentList,
                              attributeName: 'name',
                              attributeValueId: 'id',
                              okText: TranslationBase.of(context).ok,
                              okFunction: (selectedValue) {
                                setState(() {
                                  _selectedDocument = selectedValue;
                                });
                              },
                            );
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return dialog;
                              },
                            );
                          },
                        ),
                      if (_nationality != null && _nationality['id'] == 2)
                        AppTextFieldCustom(
                          height: MediaQuery.of(context).size.height * 0.075,
                          maxLines: 1,
                          hintText: TranslationBase.of(context).documentNum,
                          hasBorder: false,
                          validationError: documentNumberError,
                          controller: documentNumController,
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).birthdate,
                        dropDownText: _birthdate != null
                            ? "${AppDateUtils.convertDateToFormat(_birthdate, "yyyy-MM-dd")}"
                            : null,
                        enabled: false,
                        isTextFieldHasSuffix: true,
                        hasBorder: false,
                        validationError: birthdateError,
                        onClick: () {
                          if(_birthdate == null){
                            _birthdate = DateTime.now();
                          }
                          _selectDate(context, _birthdate,
                                  (picked) {
                                setState(() {
                                  _birthdate = picked;
                                });
                              });
                        },
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
                        textInputAction: TextInputAction.next,
                      ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).confirmPassword,
                        hasBorder: false,
                        validationError: confirmPasswordError,
                        controller: confirmPasswordController,
                        inputType: TextInputType.visiblePassword,
                        canObscure: true,
                        textInputAction: TextInputAction.next,
                      ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).phone,
                        hasBorder: false,
                        validationError: phoneError,
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      AppTextFieldCustom(
                        height: MediaQuery.of(context).size.height * 0.075,
                        maxLines: 1,
                        hintText: TranslationBase.of(context).email,
                        hasBorder: false,
                        validationError: emailError,
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
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
                    Navigator.push(
                      context,
                      FadePage(
                        page: AccountConfirmationScreen(
                          isFromRegistration: true,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context, DateTime dateTime,
      Function(DateTime picked) updateDate) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: AppDateUtils.convertFormatToDate("1950-01-01", "yyyy-MM-dd"),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null && picked != dateTime) {
      updateDate(picked);
    }
  }

}
