import 'dart:io' show Platform;

import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/app_texts_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/buttons/secondary_button.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatelessWidget {
  final String message;
  final String androidLink;
  final String iosLink;

  const UpdatePage({Key key, this.message, this.androidLink, this.iosLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        isShowAppBar: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/update_rocket_image.png',
                width: double.maxFinite,fit: BoxFit.fill,
              ),
              Image.asset('assets/images/HMG_logo.png'),
              SizedBox(height: 8,),
              AppText(
                "Update the app".toUpperCase(),fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(message??"Update the app",fontSize: 12,),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          height: 80,
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.all(15),
            child: SecondaryButton(
              color: Colors.red[800],
              onTap: () {
                if (Platform.isIOS)
                  launch(iosLink);
                else
                  launch(androidLink);
              },
              label: "updateNow".toUpperCase(),
            ),
          ),
        ),
      ),
    );
  }
}
