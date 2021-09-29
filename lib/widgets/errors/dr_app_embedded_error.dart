import 'package:flutter/material.dart';

import '../app_texts_widget.dart';

class DrAppEmbeddedError extends StatelessWidget {
  const DrAppEmbeddedError({
    Key key,
    @required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppText(
          error,
          color: Theme.of(context).errorColor,
          textAlign: TextAlign.center,
          margin: 10,
        ),
      );
  }
}