import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/popups/base_popup.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPopup extends StatefulWidget {

  @override
  _LocationPopupState createState() => _LocationPopupState();

  VoidCallback onLocationAllow;

  LocationPopup({this.onLocationAllow});
}

class _LocationPopupState extends State<LocationPopup> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BasePopup(
        headerTitle: "We kunnen je locatie niet zien!",
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "Om deze app te kunnen gebruiken moeten we wel weten waar je bent. Zet je locatie aan in de instellingen.",
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () => {
                      openAppSettings()
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: WeatherHandler.getDarkColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Instellingen", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
