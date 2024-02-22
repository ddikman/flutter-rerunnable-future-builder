import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      child: Text(text, style: TextStyle(color: Colors.white)),
      onPressed: onPressed,
    );
  }
}