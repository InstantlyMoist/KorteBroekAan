import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/home_screen/forecastbar/forecastitem.dart';
import 'package:kan_ik_een_korte_broek_aan/settings_screen/settingsscreen.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

// ignore: must_be_immutable
class ForecastBar extends StatelessWidget {

  VoidCallback forceReload;


  ForecastBar({this.forceReload});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 5, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (ForecastItem item in WeatherHandler.forecastItems)
                      item,
                    //for (String day in data.keys) ForecastItem(day, data[day]),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen(forceReload: () => forceReload(),)),
                    )
                  },
                  padding: EdgeInsets.only(left: 10, right: 15),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black.withOpacity(0.2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
