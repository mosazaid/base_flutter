import 'package:JordanElectricPowerCompany/landing_page.dart';
import 'package:JordanElectricPowerCompany/screens/authentication/LoginScreen.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/enum/APP_STATUS.dart';
import 'core/viewModel/AuthenticationViewModel.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel authenticationViewModel = Provider.of(context);

    // ignore: missing_return
    Widget buildRoot() {
      switch (authenticationViewModel.status) {
        case APP_STATUS.LOADING:
          return Scaffold(
            body: AppLoaderWidget(),
          );
        case APP_STATUS.NOT_LOGIN:
          return LoginScreen();
          break;
        case APP_STATUS.LOGIN:
          return LandingPage();
          break;
      }
    }

    return AnimatedSwitcher(
      duration: Duration(microseconds: 350),
      child: buildRoot(),
    );
  }
}
