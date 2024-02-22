import 'package:flutter/cupertino.dart';
import 'package:reprofutureloader/future_generator.dart';
import 'package:reprofutureloader/result_view.dart';

import 'button.dart';
import 'label.dart';

class WorkingFutureExample extends StatefulWidget {
  final FutureGenerator generator;

  const WorkingFutureExample({Key? key, required this.generator}) : super(key: key);

  @override
  _WorkingFutureExampleState createState() => _WorkingFutureExampleState();
}

class _WorkingFutureExampleState extends State<WorkingFutureExample> {
  Future<int>? _future;

  @override
  Widget build(BuildContext context) {
    if (_future == null) {
      return Button('Run', onPressed: _runFuture);
    }

    return ReRunnableFutureBuilder(_future as Future<int>, onRerun: _runFuture);
  }

  _runFuture() {
    _future = Future.delayed(Duration(seconds: 2), widget.generator);
    setState(() {});
  }
}

class ReRunnableFutureBuilder extends StatelessWidget {
  final Future<int> _future;
  final Function() onRerun;

  const ReRunnableFutureBuilder(this._future, { required this.onRerun });
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Label("Loading..");
          }
          if (snapshot.hasError) {
            return ResultView(
                text: snapshot.error.toString(), onRerun: onRerun);
          }
          return ResultView(
              text: "Result: ${snapshot.data}", onRerun: onRerun);
        });
  }
}