import 'package:flutter/cupertino.dart';
import 'package:reprofutureloader/result_view.dart';

import 'button.dart';
import 'label.dart';

typedef Future<int> FutureGenerator();

class FutureUseWidget extends StatefulWidget {
  final FutureGenerator generator;

  const FutureUseWidget({Key key, this.generator}) : super(key: key);

  @override
  _FutureUseWidgetState createState() => _FutureUseWidgetState();
}

class _FutureUseWidgetState extends State<FutureUseWidget> {
  Future<int> _future;

  @override
  Widget build(BuildContext context) {
    if (_future == null) {
      return Button('Run', onPressed: _runFuture);
    }

    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ResultView(
                text: "Result: ${snapshot.data}", onRerun: _runFuture);
          }
          if (snapshot.hasError) {
            return ResultView(
                text: snapshot.error.toString(), onRerun: _runFuture);
          }
          return Label("Loading..");
        });
  }

  _runFuture() {
    setState(() {
      _future = Future.delayed(Duration(seconds: 2), widget.generator);
    });
  }
}
