import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blinkingText.dart';
import 'package:wifi_flutter/wifi_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'package:flutter/animation.dart';

class FlagWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlagWidgetState();
  }
}

class FlagWidgetState extends State<FlagWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Report Self',
          style: optionStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 100.00, height: 50.00),
        Text(
          'Please enter your test number',
          style: smallTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          'If you were test postive for COVID-19',
          style: smallTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 100.00, height: 50.00),
        Container(
          width: 50.00,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Test Number',
              filled: true,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  TextStyle smallTextStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
