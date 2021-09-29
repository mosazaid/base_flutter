import 'package:JordanElectricPowerCompany/core/enum/APP_STATUS.dart';
import 'package:JordanElectricPowerCompany/core/enum/viewstate.dart';
import 'package:JordanElectricPowerCompany/core/service/AuthenticationService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../locator.dart';
import 'base_view_model.dart';

class AuthenticationViewModel extends BaseViewModel {

  AuthenticationService _authService = locator<AuthenticationService>();

  APP_STATUS app_status = APP_STATUS.LOADING;
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  // List<GetIMEIDetailsModel> get imeiDetails => _authService.dashboardItemsList;

  AuthenticationViewModel({bool checkDeviceInfo = false}) {
    // getDeviceInfoFromFirebase();
    // getDoctorProfile();
    setAppStatus(APP_STATUS.NOT_LOGIN);
  }

  /// determine the status of the app
  APP_STATUS get status {
    if (state == ViewState.Busy) {
      app_status = APP_STATUS.LOADING;
    } else {
      app_status = APP_STATUS.NOT_LOGIN;
      /*if(this.doctorProfile !=null)
        app_status = APP_STATUS.AUTHENTICATED;
      else if (this.unverified) {
        app_status = APP_STATUS.UNVERIFIED;
      } else if (this.isLogin) {
        app_status = APP_STATUS.AUTHENTICATED;
      } else {
        app_status = APP_STATUS.UNAUTHENTICATED;
      }*/
    }
    return app_status;
  }
  setAppStatus(APP_STATUS status){
    this.app_status = status;
    notifyListeners();
  }


/*  /// first step login
  Future login(UserModel userInfo) async {
    setState(ViewState.BusyLocal);
    await _authService.login(userInfo);
    if (_authService.hasError) {
      error = _authService.error;
      setState(ViewState.ErrorLocal);
    } else {
      sharedPref.setInt(PROJECT_ID, userInfo.projectID);
      loggedUser = loginInfo;
      saveObjToString(LOGGED_IN_USER, loginInfo);
      sharedPref.remove(LAST_LOGIN_USER);
      sharedPref.setString(TOKEN, loginInfo.logInTokenID);
      setState(ViewState.Idle);
    }
  }*/
}