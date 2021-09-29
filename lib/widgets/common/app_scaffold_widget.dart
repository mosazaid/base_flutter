import 'package:JordanElectricPowerCompany/config/config.dart';
import 'package:JordanElectricPowerCompany/core/viewModel/base_view_model.dart';
import 'package:JordanElectricPowerCompany/core/viewModel/project_view_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import 'app_loader_widget.dart';
import '../app_texts_widget.dart';
import 'network_base_view.dart';

class AppScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final bool isLoading;
  final bool isShowAppBar;
  final BaseViewModel baseViewModel;
  final Widget bottomSheet;
  final Color backgroundColor;
  final Widget appBar;
  final Widget drawer;
  final Widget bottomNavigationBar;
  final String subtitle;
  final bool isHomeIcon;
  final bool extendBody;
  AppScaffold(
      {this.appBarTitle = '',
      this.body,
      this.isLoading = false,
      this.isShowAppBar = true,
      this.baseViewModel,
      this.bottomSheet,
      this.backgroundColor,
      this.isHomeIcon = true,
      this.appBar, this.subtitle, this.drawer, this.extendBody = false, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    AppGlobal.CONTEX = context;
    ProjectViewModel projectProvider = Provider.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        drawer: drawer,
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        appBar: isShowAppBar
            ? appBar ??
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white, //HexColor('#515B5D'),
                  textTheme: TextTheme(
                      headline6: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.8,
                  )),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(appBarTitle.toUpperCase()),
                      if(subtitle!=null)
                        Text(subtitle,style: TextStyle(fontSize: 12,color: Colors.red),),
                    ],
                  ),
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black, //Colors.black,
                      onPressed: () => Navigator.pop(context),
                    );
                  }),
                  centerTitle: true,
                  actions: <Widget>[
                    isHomeIcon
                        ? IconButton(
                            icon: Icon(EvaIcons.home),
                            color: Colors.black, //Colors.black,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context, HOME, (r) => false),
                          )
                        : SizedBox()
                  ],
                )
            : null,
        bottomSheet: bottomSheet,
        body: projectProvider.isInternetConnection
            ? baseViewModel != null
                ? NetworkBaseView(
                    baseViewModel: baseViewModel,
                    child: body,
                  )
                : Stack(
                    children: <Widget>[body, buildAppLoaderWidget(isLoading)])
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/undraw_connected_world_wuay.png",
                      height: 250,
                    ),
                    AppText('No Internet Connection')
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildAppLoaderWidget(bool isLoading) {
    return isLoading ? AppLoaderWidget() : Container();
  }
}
