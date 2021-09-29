import 'BaseService.dart';

class AuthenticationService extends BaseService {

  // List<GetIMEIDetailsModel> _imeiDetails = [];

 /* Future login(UserModel userInfo) async {
    hasError = false;
    _loginInfo = NewLoginInformationModel();
    try {
      await baseAppClient.post(LOGIN_URL,
          onSuccess: (dynamic response, int statusCode) {
            _loginInfo = NewLoginInformationModel.fromJson(response);
          }, onFailure: (String error, int statusCode) {
            hasError = true;
            super.error = error;
          }, body: userInfo.toJson());
    } catch (error) {
      hasError = true;
      super.error = error;
    }
  }*/

}