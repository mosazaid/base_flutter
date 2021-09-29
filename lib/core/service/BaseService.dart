import 'package:JordanElectricPowerCompany/client/base_app_client.dart';
import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';

class BaseService {

  String error;
  bool hasError = false;
  BaseAppClient baseAppClient = BaseAppClient();
  AppSharedPreferences sharedPref = new AppSharedPreferences();
  // DoctorProfileModel doctorProfile;

/*  Future<DoctorProfileModel> getDoctorProfile({bool isGetProfile = false}) async {
    if(isGetProfile)
    {
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
  }*/
}