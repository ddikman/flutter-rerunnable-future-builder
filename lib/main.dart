import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reprofutureloader/failing_future_example.dart';
import 'package:reprofutureloader/working_future_example.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                    Center(child: WorkingFutureExample(generator: _generateRandomInt))
                  ],
                )
              ),
            )
        )
    );
  }

  Future<int> _generateRandomInt() {
    return Future.delayed(Duration(milliseconds: 500), () {
      final number = Random().nextInt(1000);
      if (number > 500) {
        throw new Exception("Error");
      }
      return number;
    });
  }
}