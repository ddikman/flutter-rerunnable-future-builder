import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String _text;

  const Label(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text, style: Theme.of(context).textTheme.bodyText1);
  }
}