import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NoLocationScreen extends StatefulWidget {
  @override
  _NoLocationScreenState createState() => _NoLocationScreenState();

  VoidCallback onLocationAllow;

  NoLocationScreen({this.onLocationAllow});
}

class _NoLocationScreenState extends State<NoLocationScreen>
    with WidgetsBindingObserver {


  bool _granted = false;

  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state.toString());
    if (state == AppLifecycleState.resumed) {
      bool granted = await Permission.location.isGranted;
      if (granted != _granted) {
        setState(() {
          widget.onLocationAllow();
        });
      }
    }
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
