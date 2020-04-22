import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/main_screen.dart';
import 'package:kan_ik_een_korte_broek_aan/loadscreen/loading_screen.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget baseScreen = LoadingScreen();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    load();
  }

  void load() async {
    print('loading');
    await WeatherHandler.initializeData();
    setState(() {
      baseScreen = MainScreen();
    });
    print('data loaded OK!');
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
