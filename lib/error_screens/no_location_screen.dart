import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/text/titletext.dart';
import 'package:permission_handler/permission_handler.dart';

class NoLocationScreen extends StatefulWidget {
  @override
  _NoLocationScreenState createState() => _NoLocationScreenState();


}

class _NoLocationScreenState extends State<NoLocationScreen>
    with WidgetsBindingObserver {



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
      backgroundColor: Color(0xFFBCCBD8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("We hebben geen toestemming om je locatie te zien!"),
            Image(image: AssetImage("assets/images/no-man-plain.png")),
            RaisedButton(
              padding: EdgeInsets.all(20),
              onPressed: () => {handlePermission()},
              child: Text("Klik hier om het aan te passen"),
            )
          ],
        ),
      ),
    );
  }
}
