import 'package:flutter/material.dart';

import '../app_texts_widget.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key key,
    @required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Image.asset('assets/images/no-data.png'),
            Center(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12,right: 20, left: 30),
                  child: Center(child: AppText(error??'' , textAlign: TextAlign.center,)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
