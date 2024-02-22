import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reprofutureloader/button.dart';

import 'label.dart';

class ResultView extends StatelessWidget {
  final String text;
  final Function() onRerun;

  const ResultView({Key? key, required this.text, required this.onRerun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Label(text),
        Button("Rerun", onPressed: onRerun)
      ],
    );
  }
}