import 'dart:async';

import 'package:JordanElectricPowerCompany/client/base_app_client.dart';
import 'package:JordanElectricPowerCompany/config/shared_pref_kay.dart';
import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';
import 'package:JordanElectricPowerCompany/utils/helpers.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Helpers helpers = Helpers();

class ProjectViewModel with ChangeNotifier {
  AppSharedPreferences sharedPref = AppSharedPreferences();
  Locale _appLocale;
  String currentLanguage = 'ar';
  bool _isArabic = true;
  bool isInternetConnection = true;
  bool isLoading = false;
  bool isError = false;
  String error = '';
  BaseAppClient baseAppClient = BaseAppClient();

  Locale get appLocal => _appLocale;

  bool get isArabic => _isArabic;
  StreamSubscription subscription;
  ProjectViewModel() {
    loadSharedPrefLanguage();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
          isInternetConnection = true;
          break;
        case ConnectivityResult.mobile:
          isInternetConnection = true;
          break;
        case ConnectivityResult.none:
          isInternetConnection = false;
          break;
      }
      notifyListeners();
    });
  }

  void loadSharedPrefLanguage() async {
    currentLanguage = await sharedPref.getString(APP_Language);
    _appLocale = Locale(currentLanguage ?? 'ar');
    _isArabic = currentLanguage != null
        ? currentLanguage == 'ar'
            ? true
            : false
        : true;
    notifyListeners();
  }

  void changeLanguage(String lan) {
    if (lan != "en" && currentLanguage != lan) {
      _appLocale = Locale("ar");
      _isArabic = true;
      currentLanguage = 'ar';
      sharedPref.setString(APP_Language, 'ar');
    } else if (lan != "ar" && currentLanguage != lan) {
      _appLocale = Locale("en");
      _isArabic = false;
      currentLanguage = 'en';
      sharedPref.setString(APP_Language, 'en');
    }
    callServicesAfterChangeLang();
    notifyListeners();
  }

  callServicesAfterChangeLang() {
    // TODO MOSA CHECK IT
    // getProfile();
    // getDoctorClinicsList();
  }

  @override
  void dispose() {
    if (subscription != null) subscription.cancel();
    super.dispose();
  }

/*  Future<dynamic> getDoctorClinicsList() async {
    try {
      dynamic localRes;

      await baseAppClient.post(GET_CLINICS_FOR_DOCTOR,
          onSuccess: (dynamic response, int statusCode) {
        doctorClinicsList = [];
        response['List_DoctorsClinic'].forEach((v) {
          doctorClinicsList.add(new ClinicModel.fromJson(v));
        });
        localRes = response;
      }, onFailure: (String error, int statusCode) {
        throw error;
      }, body: Map());

      return Future.value(localRes);
    } catch (error) {
      print(error);
      throw error;
    }
  }*/

 /* void getProfile() async {
    Map profile = await sharedPref.getObj(DOCTOR_PROFILE);
    DoctorProfileModel doctorProfile = new DoctorProfileModel.fromJson(profile);
    ClinicModel clinicModel = ClinicModel(doctorID:doctorProfile.doctorID,clinicID: doctorProfile.clinicID, projectID: doctorProfile.projectID,);

    await Provider.of<AuthenticationViewModel>(AppGlobal.CONTEX, listen: false)
        .getDoctorProfileBasedOnClinic(clinicModel);
  }*/
}
