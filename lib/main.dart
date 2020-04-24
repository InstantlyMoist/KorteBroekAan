import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kan_ik_een_korte_broek_aan/error_screens/no_location_screen.dart';
import 'package:kan_ik_een_korte_broek_aan/home_screen/main_screen.dart';
import 'package:kan_ik_een_korte_broek_aan/load_screen/loading_screen.dart';
import 'package:kan_ik_een_korte_broek_aan/preferences_handler.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget baseScreen = Container();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    load();
  }

  void load() async {
    setState(() {
      baseScreen = LoadingScreen();
    });

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("no permission, handle this");
        setState(() {
          baseScreen = NoLocationScreen(onLocationAllow: ()  {
            setState(() {
              baseScreen = LoadingScreen();
            });
            load();
          });
        });
        return;
      }
    }

    _locationData = await location.getLocation();
    await PreferencesHandler.load();
    await WeatherHandler.initializeData(_locationData);
    setState(() {
      baseScreen = MainScreen(forceReload: () => load(),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kan ik een korte broek aan',
        theme: ThemeData(
          fontFamily: 'CircularStd',
        ),
        home: baseScreen);
  }
}
