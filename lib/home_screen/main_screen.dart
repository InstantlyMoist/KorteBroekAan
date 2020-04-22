import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/home_screen/header.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

import 'forecastbar/forecastbar.dart';
import 'weatherimage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(WeatherHandler.shortPantsToday ? 0xFFFDEBD1 : 0xFFBCCBD8),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 150,
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 50, left: 50),
          child: Center(
            child: Column(
              children: <Widget>[
                Header(),
                Spacer(),
                WeatherImage(WeatherHandler.shortPantsToday),
                Spacer(),
                ForecastBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
