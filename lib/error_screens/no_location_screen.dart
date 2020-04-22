import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NoLocationScreen extends StatefulWidget {
  @override
  _NoLocationScreenState createState() => _NoLocationScreenState();
}

class _NoLocationScreenState extends State<NoLocationScreen>
    with WidgetsBindingObserver {
  VoidCallback onSettingsLeave;

  AppLifecycleState _currentState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('changing state');
    _currentState = state;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void handlePermission() async {
    print("hello world");
    bool isOpened = await openAppSettings();
    await compute(notifyOnFocus, true);
    print("Done, refocussing");
  }

  Future notifyOnFocus(bool test) async {
    while (_currentState != AppLifecycleState.resumed) {

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Je moet je locatie wel accepteren ei"),
            FlatButton(
              onPressed: () => {handlePermission()},
              child: Text("Klik hier om het aan te passen"),
            )
          ],
        ),
      ),
    );
  }
}
