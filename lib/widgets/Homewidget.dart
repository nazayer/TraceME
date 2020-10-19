import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'scanWedgit.dart';

// class HomeWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class HomeWidgetState extends State<HomeWidget> {
//   bool scannig = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text('Home', style: optionStyle, textAlign: TextAlign.center),
//         SizedBox(width: 100, height: 80.00),
//         ScanWidget(),
//       ],
//     );
//   }

//   static const TextStyle optionStyle = TextStyle(
//     fontSize: 30,
//     fontWeight: FontWeight.bold,
//   );
// }

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Home', style: optionStyle, textAlign: TextAlign.center),
        SizedBox(width: 100, height: 80.00),
        ScanWidget(),
      ],
    );
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
