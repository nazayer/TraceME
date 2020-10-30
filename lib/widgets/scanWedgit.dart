import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blinkingText.dart';
import 'package:wifi_flutter/wifi_flutter.dart';
import 'package:wifi_iot/wifi_iot.dart';

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
  Duration scanPeriod = Duration(minutes: 2);
  String _bssid = '';

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
      width: 200,
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
          final bssidTest = await WiFiForIoTPlugin.getBSSID();
          final networks = await WifiFlutter.wifiNetworks;
          //need to find a way to repeat this function
          setState(() {
            _platformVersion = networks
                .map((network) => Text(
                      '''
                Ssid: ${network.ssid}
                Strength: ${network.rssi}
                Timestamp: ${DateTime.now()}
                BSSID: ${bssidTest}
                ''',
                      style: optionStyle,
                      textAlign: TextAlign.left,
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
            _showMyDialog();
          }),
    );
  }

  static const TextStyle flashingStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle optionStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'This action will cause the application to stop contact tracing function.'),
                SizedBox(width: 20, height: 20),
                Text('Would you like to continue?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _scanning = !_scanning;
                  _platformVersion.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
