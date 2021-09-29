import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:flutter/material.dart';

import '../app_texts_widget.dart';

class ProfileImageWidget extends StatelessWidget {
  String url;
  String name;
  String des;
  double height;
  double width;
  Color color;
  double fontsize;
  ProfileImageWidget(
      {this.url,
      this.name,
      this.des,
      this.height,
      this.width,
      this.fontsize,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height,
          width: width,
          child:CircleAvatar(
            radius:
            SizeConfig.imageSizeMultiplier * 12,
            //     radius: (52)
            child: ClipRRect(
              borderRadius:BorderRadius.circular(50),

              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 700,
              ),
            ),
            backgroundColor: Colors.transparent,
          )
        ),
        name == null || des == null
            ? SizedBox()
            : SizedBox(
                height: 10,
              ),
        name == null
            ? SizedBox()
            : AppText(
                name,
                fontWeight: FontWeight.bold,
                fontSize: fontsize == null
                    ? SizeConfig.textMultiplier * 3.5
                    : fontsize,
                color: color,
              ),
        des == null
            ? SizedBox()
            : AppText(
                des,
                fontSize: fontsize == null
                    ? SizeConfig.textMultiplier * 2.5
                    : fontsize,
              )
      ],
    );
  }
}
