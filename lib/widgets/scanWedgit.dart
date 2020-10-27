import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blinkingText.dart';
import 'package:wifi_flutter/wifi_flutter.dart';
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
  void initState() {
    super.initState();
  }

  List<Widget> _platformVersion = [];
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
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _platformVersion,
          ),
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
        onPressed: () async {
          final noPermissions = await WifiFlutter.promptPermissions();
          if (noPermissions) {
            return;
          }
          final networks = await WifiFlutter.wifiNetworks;
          setState(() {
            _platformVersion = networks
                .map((network) => Text(
                      '''
                Ssid: ${network.ssid}
                Strength: ${network.rssi}
                Timestamp: ${DateTime.now()}''',
                      textAlign: TextAlign.left,
                      style: optionStyle,
                    ))
                .toList();
            _scanning = !_scanning;
          });
        },
      ),
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
              _platformVersion.clear();
            });
          }),
    );
  }

  static const TextStyle flashingStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
}
