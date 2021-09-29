import 'package:JordanElectricPowerCompany/core/enum/viewstate.dart';
import 'package:JordanElectricPowerCompany/core/viewModel/base_view_model.dart';
import 'package:JordanElectricPowerCompany/widgets/errors/error_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_loader_widget.dart';



class NetworkBaseView extends StatelessWidget {
  final BaseViewModel baseViewModel;
  final Widget child;

  NetworkBaseView({Key key, this.baseViewModel, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: buildBaseViewWidget(),
    );
  }

  buildBaseViewWidget() {
    switch (baseViewModel.state) {
      case ViewState.ErrorLocal:
      case ViewState.Idle:
      case ViewState.BusyLocal:
        return child;
        break;
      case ViewState.Busy:
        return AppLoaderWidget();
        break;
      case ViewState.Error:
        return ErrorMessage(error: baseViewModel.error ,);
        break;
    }
  }
}
