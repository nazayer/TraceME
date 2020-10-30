import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'scanWedgit.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Home', style: optionStyle, textAlign: TextAlign.center),
        SizedBox(width: 100.00, height: 50.00),
        ScanWidget(),
      ],
    );
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
