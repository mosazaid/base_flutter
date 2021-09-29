import 'package:flutter/material.dart';

import '../loader/gif_loader_container.dart';

class AppLoaderWidget extends StatefulWidget {
  AppLoaderWidget({Key key, this.title, this.containerColor}) : super(key: key);

  final String title;
  final Color containerColor;

  @override
  _AppLoaderWidgetState createState() => new _AppLoaderWidgetState();
}

class _AppLoaderWidgetState extends State<AppLoaderWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,

      child: Stack(
        children: [
          Container(
            color: widget.containerColor??Colors.grey.withOpacity(0.6),
          ),
          Container(child: GifLoaderContainer(), margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.09))
        ],
      ),
    );
  }
}
