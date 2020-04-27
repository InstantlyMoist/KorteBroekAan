import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/home_screen/header.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

import 'forecastbar/forecastbar.dart';
import 'weatherimage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();

  VoidCallback forceReload;

  MainScreen({this.forceReload});


}

class _MainScreenState extends State<MainScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeatherHandler.getBackgroundColor(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Container(
            child: Column(
              children: <Widget>[
                Header(forceReload: () => widget.forceReload(),),
                Expanded(child: WeatherImage(WeatherHandler.shortPantsToday)),
                ForecastBar(forceReload: () => widget.forceReload(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
