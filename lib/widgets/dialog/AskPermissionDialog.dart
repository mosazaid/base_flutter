import 'package:JordanElectricPowerCompany/widgets/buttons/app_buttons_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app_texts_widget.dart';

class AskPermissionDialog extends StatefulWidget {
  final String type;
  final Function onTapGrant;

  AskPermissionDialog({this.type, this.onTapGrant});

  @override
  _AskPermissionDialogState createState() => _AskPermissionDialogState();
}

class _AskPermissionDialogState extends State<AskPermissionDialog> {
  getText() {
    return "Turn on your Camera, Microphone to start video call";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: Feedback.wrapForTap(() {
                Navigator.pop(context);
              }, context),
              child:
                  Icon(EvaIcons.close, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                "🙋‍♀",
                style: "headline1",
                color: Colors.black,
              ),
              AppText(
                "Don't miss out!",
                style: "headline4",
                color: Colors.black,
              ),
              SizedBox(
                height: 8,
              ),
              AppText(
                getText(),
                color: Colors.grey,
                style: "bodyText2",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              AppButton(
                fontColor: Theme.of(context).backgroundColor,
                color: Colors.red[700],
                title: "Turn On Camera, Microphone",
                onPressed: () async {
                  openAppSettings().then((value) {
                    Navigator.pop(context);
                    widget.onTapGrant();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
