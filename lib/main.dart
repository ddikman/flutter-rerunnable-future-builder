import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reprofutureloader/failing_future_example.dart';

import 'label.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            color: Colors.white,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('FutureBuilder example'),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(icon: Icon(Icons.mood_bad), text: 'Not working'),
                      Tab(icon: Icon(Icons.mood), text: 'Working'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Center(child: FailingFutureExample(generator: _generateRandomInt)),
                    Center(child: Label('Nice one'))
                  ],
                )
              ),
            )
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