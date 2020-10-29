import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TraceMe/blocs/authentication/authentication.dart';
import '../models/models.dart';

class AlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Alert', style: optionStyle, textAlign: TextAlign.center),
        SizedBox(width: 100.00, height: 50.00),
        Text("No Alerts are issued to you yet",
            style: noAlertStyle, textAlign: TextAlign.center),
      ],
    );
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle noAlertStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );
}
