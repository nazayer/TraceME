import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blinkingText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'package:flutter/animation.dart';

class ScanWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScanWidgetState();
  }
}

class ScanWidgetState extends State<ScanWidget> {
  bool _scanning = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _scanning
              ? MyBlinkingText()
              : Text(
                  'Not tracing',
                  style: flashingStyle,
                  textAlign: TextAlign.center,
                ),
          SizedBox(width: 20.00, height: 20.00),
          _scanning ? stop() : scan(),
          SizedBox(width: 20.00, height: 20.00),
          Text('$_scanning', textAlign: TextAlign.center, style: optionStyle),
        ]);
  }

  Widget scan() {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: FloatingActionButton(
          child: new Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 100.00,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              _scanning = !_scanning;
            });
          }),
    );
  }

  Widget stop() {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: FloatingActionButton(
          child: new Icon(
            Icons.stop_sharp,
            color: Colors.white,
            size: 100.00,
          ),
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              _scanning = !_scanning;
            });
          }),
    );
  }

  static const TextStyle flashingStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
