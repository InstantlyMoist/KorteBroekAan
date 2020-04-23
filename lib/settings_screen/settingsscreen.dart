import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/settings_screen/weatherslider.dart';
import 'package:kan_ik_een_korte_broek_aan/text/titletext.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(WeatherHandler.shortPantsToday ? 0xFFC34F22 : 0xFF125B7F),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: "Instellingen",
                  color: Color(
                      WeatherHandler.shortPantsToday ? 0xFFFDEBD1 : 0xFFBCCBD8),
                ),
                WeatherSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
