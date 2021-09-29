import 'package:flutter/material.dart';

class DividerWithSpacesAround extends StatelessWidget {
  DividerWithSpacesAround({
    Key key, this.height = 0,
  });
  final  double height ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Color(0xffCCCCCC),
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }
}
