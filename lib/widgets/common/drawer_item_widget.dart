import 'dart:ui';

import 'package:JordanElectricPowerCompany/config/size_config.dart';
import 'package:flutter/material.dart';

import '../app_texts_widget.dart';


class DrawerItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  final String assetLink;

  DrawerItem(this.title, {this.icon, this.color, this.subTitle = '', this.assetLink});

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0, bottom: 5, left: 0, right: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(widget.assetLink!=null)
              Container(
                height: 20,
                width: 20,
                child: Image.asset(widget.assetLink),
              ),
            if(widget.assetLink==null)
            Icon(
              widget.icon,
              color: widget.color ?? Colors.black87,
              size: SizeConfig.imageSizeMultiplier * 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width *0.45,
                    child: AppText(
                      widget.title,
                      marginLeft: 5,
                      marginRight: 5,
                      color:widget.color ??Color(0xFF2E303A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
