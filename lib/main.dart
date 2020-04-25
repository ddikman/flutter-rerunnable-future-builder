import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reprofutureloader/future_use_widget.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            color: Colors.white,
            child: Center(child: FutureUseWidget(generator: _generateRandomInt))
        )
    );
  }

  Future<int> _generateRandomInt() {
    return Future.delayed(Duration(seconds: 2), () {
      final number = Random().nextInt(1000);
      if (number > 500) {
        throw new Exception("Error");
      }
      return number;
    });
  }
}