import 'package:JordanElectricPowerCompany/core/enum/viewstate.dart';
import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  AppSharedPreferences sharedPref = new AppSharedPreferences();
  // DoctorProfileModel doctorProfile;

  ViewState _state = ViewState.Idle;
  bool isInternetConnection = true;

  ViewState get state => _state;

  String error = "";

  void setState(ViewState viewState) {
    _state = viewState;

    notifyListeners();
  }

/*
  Future<DoctorProfileModel> getDoctorProfile({bool isGetProfile = false}) async {
    if (isGetProfile) {
      Map profile = await sharedPref.getObj(DOCTOR_PROFILE);
      if (profile != null) {
        doctorProfile = DoctorProfileModel.fromJson(profile);
        if (doctorProfile != null) {
          return doctorProfile;
        }
      }
    }
    if (doctorProfile == null) {
      Map profile = await sharedPref.getObj(DOCTOR_PROFILE);
      if (profile != null) {
        doctorProfile = DoctorProfileModel.fromJson(profile);
        if (doctorProfile != null) {
          return doctorProfile;
        }
      }
      return null;
    } else {
      return doctorProfile;
    }
  }

  setDoctorProfile(DoctorProfileModel doctorProfile) async {
    await sharedPref.setObj(DOCTOR_PROFILE, doctorProfile);
    this.doctorProfile = doctorProfile;
    notifyListeners();
  }
*/
}
