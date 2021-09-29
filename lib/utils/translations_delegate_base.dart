import 'dart:async';

import 'package:JordanElectricPowerCompany/config/localized_values.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class TranslationBase {
  TranslationBase(this.locale);

  final Locale locale;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }

  String get language => localizedValues['language'][locale.languageCode];

  String get lanEnglish => localizedValues['lanEnglish'][locale.languageCode];

  String get lanArabic => localizedValues['lanArabic'][locale.languageCode];

  String get cancel => localizedValues['cancel'][locale.languageCode];

  String get ok => localizedValues['ok'][locale.languageCode];

  String get confirm => localizedValues['confirm'][locale.languageCode];

  String get done => localizedValues['done'][locale.languageCode];

  String get next => localizedValues['next'][locale.languageCode];

  String get fromDate => localizedValues['fromDate'][locale.languageCode];

  String get toDate => localizedValues['toDate'][locale.languageCode];

  String get fromTime => localizedValues['fromTime'][locale.languageCode];

  String get toTime => localizedValues['toTime'][locale.languageCode];

  String get emptyMessage =>
      localizedValues['emptyMessage'][locale.languageCode];

  String get requiredField =>
      localizedValues['requiredField'][locale.languageCode];

  String get search => localizedValues['search'][locale.languageCode];

  // dates

  String get days => localizedValues['days'][locale.languageCode];

  String get months => localizedValues['months'][locale.languageCode];

  String get years => localizedValues['years'][locale.languageCode];

  String get hr => localizedValues['hr'][locale.languageCode];

  String get min => localizedValues['min'][locale.languageCode];

  // Authentication

  String get login => localizedValues['login'][locale.languageCode];

  String get jobNumber => localizedValues['jobNumber'][locale.languageCode];

  String get password => localizedValues['password'][locale.languageCode];

  String get forgetPassword =>
      localizedValues['forgetPassword'][locale.languageCode];

  String get registerNewUser =>
      localizedValues['registerNewUser'][locale.languageCode];

  String get resetPassword =>
      localizedValues['resetPassword'][locale.languageCode];

  String get accountConfirmation =>
      localizedValues['accountConfirmation'][locale.languageCode];

  String get accountConfirmationDesc =>
      localizedValues['accountConfirmationDesc'][locale.languageCode];

  String get reSendVerificationCode =>
      localizedValues['reSendVerificationCode'][locale.languageCode];

  String get newPassword => localizedValues['newPassword'][locale.languageCode];

  String get confirmPassword =>
      localizedValues['confirmPassword'][locale.languageCode];

  String get setNewPassword =>
      localizedValues['setNewPassword'][locale.languageCode];

  String get passwordChangedMsg =>
      localizedValues['PasswordChangedMsg'][locale.languageCode];

  String get passwordChangedMsgSuccess =>
      localizedValues['PasswordChangedMsgSuccess'][locale.languageCode];
  String get registerMsg =>
      localizedValues['registerMsg'][locale.languageCode];
  String get registerMsgSuccess =>
      localizedValues['registerMsgSuccess'][locale.languageCode];

  String get nationality =>
      localizedValues['nationality'][locale.languageCode];
  String get id  =>
      localizedValues['id'][locale.languageCode];
  String get documentType  =>
      localizedValues['documentType'][locale.languageCode];
  String get documentNum  =>
      localizedValues['documentNum'][locale.languageCode];
  String get birthdate  =>
      localizedValues['birthdate'][locale.languageCode];
  String get phone  =>
      localizedValues['phone'][locale.languageCode];
  String get email  =>
      localizedValues['email'][locale.languageCode];

}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
