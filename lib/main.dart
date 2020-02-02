import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/header.dart';

import 'homescreen/weatherimage.dart';
import 'homescreen/forecastbar/forecastbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kan ik een korte broek aan',
      theme: ThemeData(
        fontFamily: 'CircularStd',
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFBCCBD8),
          body: Container(
            margin: EdgeInsets.only(bottom: 45, top: 45, right :22, left: 22),
            child: Center(
                child: Column(
                  children: <Widget>[
                      Header(),
                      Spacer(),
                      WeatherImage(),
                      Spacer(),
                      ForecastBar()
                  ],
                ),
            ),
          ),
        ),
      )
    );
  }
}
