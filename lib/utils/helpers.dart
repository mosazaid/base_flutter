import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';
import 'package:JordanElectricPowerCompany/utils/app_toast_msg.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';


AppSharedPreferences sharedPref = new AppSharedPreferences();

class Helpers {
  static int cupertinoPickerIndex = 0;

  get currentLanguage => null;

  static showConfirmationDialog(
      BuildContext context, String message, Function okFunction) {
    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: null,
                  content: Container(
                    child: AppText(message),
                  ),
                  actions: [
                    AppButton(
                      onPressed: okFunction,
                      title: TranslationBase.of(context).confirm,
                      fontColor: Colors.white,
                      color: Colors.green[600],
                    ),
                    AppButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: TranslationBase.of(context).cancel,
                      fontColor: Colors.white,
                      color: Colors.red[600],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  /*static showCupertinoPicker(context, List<GetHospitalsResponseModel> items,
      decKey, onSelectFun, AuthenticationViewModel model) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (BuildContext builder) {
          return Container(
            // height: 500,
            height: SizeConfig.realScreenHeight * 0.4,
            color: Color(0xfff7f7f7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: Color(0xfff7f7f7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CupertinoButton(
                        child: Text(TranslationBase.of(context).cancel,
                            style: textStyle(context)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoButton(
                        child: Text(
                          TranslationBase.of(context).done,
                          style: textStyle(context),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onSelectFun(cupertinoPickerIndex);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                    height: SizeConfig.realScreenHeight * 0.3,
                    color: Color(0xfff7f7f7),
                    child: buildPickerItems(
                        context, items, decKey, onSelectFun, model))
              ],
            ),
          );
        });
  }*/

  static TextStyle textStyle(context) =>
      TextStyle(color: Theme.of(context).primaryColor);

/*  static buildPickerItems(context, List<GetHospitalsResponseModel> items,
      decKey, onSelectFun, model) {
    return CupertinoPicker(
      magnification: 1.5,
      scrollController:
          FixedExtentScrollController(initialItem: cupertinoPickerIndex),
      children: items.map((item) {
        return Text(
          '${item.facilityName}',
          style: TextStyle(fontSize: SizeConfig.textMultiplier * 2),
        );
      }).toList(),
      itemExtent: 25,
      looping: false,
      onSelectedItemChanged: (int index) {
        cupertinoPickerIndex = index;
      },
    );
  }*/

  static showErrorToast([msg]) {
    String localMsg = generateContactAdminMsg();

    if (msg != null) {
      localMsg = msg.toString();
    }

    AppToastMsg.showErrorToast(localMsg);
  }

  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static generateContactAdminMsg([err = null]) {
    //TODO: Add translation
    String localMsg = 'Something wrong happened, please contact the admin';
    if (err != null) {
      localMsg = localMsg + '\n \n' + err.toString();
    }
    return localMsg;
  }

  static clearSharedPref() async {
    await sharedPref.clear();
  }

 /* navigateToUpdatePage(String message, String androidLink, iosLink) {
    Navigator.pushAndRemoveUntil(
        AppGlobal.CONTEX,
        FadePage(
          page: UpdatePage(
            message: message,
            androidLink: androidLink,
            iosLink: iosLink,
          ),
        ),
        (r) => false);
  }*/

  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  static InputDecoration textFieldSelectorDecoration(
      String hintText, String selectedText, bool isDropDown,
      {Icon suffixIcon, Color dropDownColor}) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
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
      ),
      hintText: selectedText != null ? selectedText : hintText,
      suffixIcon: isDropDown
          ? suffixIcon != null
              ? suffixIcon
              : Icon(
                  Icons.arrow_drop_down,
                  color: dropDownColor != null ? dropDownColor : Colors.black,
                )
          : null,
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  static BoxDecoration containerBorderDecoration(
      Color containerColor, Color borderColor,
      {double borderWidth = -1}) {
    return BoxDecoration(
      color: containerColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.fromBorderSide(BorderSide(
        color: borderColor,
        width: borderWidth == -1 ? 2.0 : borderWidth,
      )),
    );
  }

  /// hides the keyboard if its already open
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static String capitalize(str) {
    if (str != "") {
      return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
    } else {
      return str;
    }
  }

  static bool isTextHtml(String text) {
    var htmlRegex = RegExp("<(“[^”]*”|'[^’]*’|[^'”>])*>");
    return htmlRegex.hasMatch(text);
  }

  static String timeFrom({Duration duration}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
