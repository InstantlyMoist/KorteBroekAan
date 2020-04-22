import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/header.dart';

import 'homescreen/weatherimage.dart';
import 'homescreen/forecastbar/forecastbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool shortPants = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    handleWeather();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void handleWeather() async {
    print("Testing this now!");
    String today = DateFormat('EEEE').format(DateTime.now()).substring(0,3).toLowerCase();
    print(today);
    var response = await http.get("http://kortebroekaan-server.herokuapp.com/api/weatherdata?lat=51.6062059&lon=4.7451539");
    var decoded = jsonDecode(response.body);
    setState(() {
      shortPants = meetsConditions(decoded[today]["temp"], decoded[today]["chanceOfRain"]);
    });

  }

  bool meetsConditions(double temp, bool rain) {
    return !rain && temp > 10;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kan ik een korte broek aan',
        theme: ThemeData(
          fontFamily: 'CircularStd',
        ),
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(shortPants ? 0xFFFDEBD1 : 0xFFBCCBD8),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(bottom: 45, top: 45, right: 50, left: 50),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Header(),
                    Spacer(),
                    WeatherImage(shortPants),
                    Spacer(),
                    ForecastBar()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
