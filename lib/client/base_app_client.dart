import 'dart:convert';
import 'dart:io' show Platform;

import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/config/shared_pref_kay.dart';
import 'package:JordanElectricPowerCompany/utils/app_shared_pref.dart';
import 'package:JordanElectricPowerCompany/utils/helpers.dart';

AppSharedPreferences sharedPref = new AppSharedPreferences();
Helpers helpers = new Helpers();

class BaseAppClient {
/*  post(String endPoint,
      {Map<String, dynamic> body,
      Function(dynamic response, int statusCode) onSuccess,
      Function(String error, int statusCode) onFailure,
      bool isAllowAny = false,
      bool isLiveCare = false}) async {
    String url;
    if (isLiveCare)
      url = BASE_URL_LIVE_CARE + endPoint;
    else
      url = BASE_URL + endPoint;

    bool callLog = true;
    try {
      Map profile = await sharedPref.getObj(DOCTOR_PROFILE);
      String token = await sharedPref.getString(TOKEN);
      if (profile != null) {
        DoctorProfileModel doctorProfile = DoctorProfileModel.fromJson(profile);
        if (body['DoctorID'] == null) body['DoctorID'] = doctorProfile?.doctorID;
        if (body['DoctorID'] == "") body['DoctorID'] = null;
        if (body['EditedBy'] == null) body['EditedBy'] = doctorProfile?.doctorID;
        if (body['ProjectID'] == null) {
          body['ProjectID'] = doctorProfile?.projectID;
        }

        if (body['ClinicID'] == null) body['ClinicID'] = doctorProfile?.clinicID;
      }
      if (body['DoctorID'] == '') {
        body['DoctorID'] = null;
      }
      if (body['EditedBy'] == '') {
        body.remove("EditedBy");
      }
      if (body['TokenID'] == null) {
        body['TokenID'] = token ?? '';
      }
      // body['TokenID'] = "@dm!n" ?? '';
      String lang = await sharedPref.getString(APP_Language);
      if (lang != null && lang == 'ar')
        body['LanguageID'] = 1;
      else
        body['LanguageID'] = 2;

      body['stamp'] = STAMP;
      // if(!body.containsKey("IPAdress"))
      body['IPAdress'] = IP_ADDRESS;
      body['VersionID'] = VERSION_ID;
      body['Channel'] = CHANNEL;
      body['SessionID'] = SESSION_ID;
      body['IsLoginForDoctorApp'] = IS_LOGIN_FOR_DOCTOR_APP;
      body['PatientOutSA'] = body['PatientOutSA'] ?? 0; // PATIENT_OUT_SA;
      if (body['VidaAuthTokenID'] == null) {
        body['VidaAuthTokenID'] = await sharedPref.getString(VIDA_AUTH_TOKEN_ID);
      }
      if (body['VidaRefreshTokenID'] == null) {
        body['VidaRefreshTokenID'] = await sharedPref.getString(VIDA_REFRESH_TOKEN_ID);
      }

      int projectID = await sharedPref.getInt(PROJECT_ID);
      if (projectID == 2 || projectID == 3)
        body['PatientOutSA'] = true;
      else if ((body.containsKey('facilityId') && body['facilityId'] == 2 || body['facilityId'] == 3) ||
          body['ProjectID'] == 2 ||
          body['ProjectID'] == 3)
        body['PatientOutSA'] = true;
      else
        body['PatientOutSA'] = false;

      body['DeviceTypeID'] = Platform.isAndroid ? 1 : 2;
      print("URL : $url");
      print("Body : ${json.encode(body)}");
      var asd = json.encode(body);
      var asd2;
      if (await Helpers.checkConnection()) {
        final response = await http.post(url,
            body: json.encode(body), headers: {'Content-Type': 'application/json', 'Accept': 'application/json'});
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode >= 400) {
          onFailure(Helpers.generateContactAdminMsg(), statusCode);
        } else {
          var parsed = json.decode(response.body.toString());
          if (parsed['ErrorType'] == 4) {
            helpers.navigateToUpdatePage(parsed['ErrorEndUserMessage'], parsed['AndroidLink'], parsed['IOSLink']);
          }

          if (parsed['IsAuthenticated'] != null && !parsed['IsAuthenticated']) {
            if (body['OTP_SendType'] != null) {
              onFailure(getError(parsed), statusCode);
            } else if (!isAllowAny) {
              await Provider.of<AuthenticationViewModel>(AppGlobal.CONTEX, listen: false).logout();

              Helpers.showErrorToast('Your session expired Please login again');
              locator<NavigationService>().pushNamedAndRemoveUntil(ROOT);
            }
            if (isAllowAny) {
              onFailure(getError(parsed), statusCode);
            }
          } else if (parsed['MessageStatus'] == 1) {
            if (!parsed['IsAuthenticated'])
              onFailure(getError(parsed), statusCode);
            else
              onSuccess(parsed, statusCode);
          } else {
            onFailure(getError(parsed), statusCode);
          }
        }
      } else {
        onFailure('Please Check The Internet Connection', -1);
      }
    } catch (e) {
      print(e);
      onFailure(e.toString(), -1);
    }
  }*/

  String getError(parsed) {
    //TODO change this fun
    String error = parsed['ErrorEndUserMessage'] ?? parsed['ErrorMessage'];
    if (parsed["ValidationErrors"] != null) {
      error = parsed["ValidationErrors"]["StatusMessage"].toString() + "\n";

      if (parsed["ValidationErrors"]["ValidationErrors"] != null &&
          parsed["ValidationErrors"]["ValidationErrors"].length != 0) {
        for (var i = 0; i < parsed["ValidationErrors"]["ValidationErrors"].length; i++) {
          error = error + parsed["ValidationErrors"]["ValidationErrors"][i]["Messages"][0] + "\n";
        }
      }
    }
    if (error == null || error == "null" || error == "null\n") {
      return Helpers.generateContactAdminMsg();
    }
    return error;
  }
}
