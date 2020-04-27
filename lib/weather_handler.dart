import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kan_ik_een_korte_broek_aan/home_screen/forecastbar/forecastitem.dart';
import 'package:kan_ik_een_korte_broek_aan/preferences_handler.dart';
import 'package:location/location.dart';

class WeatherHandler {
  static bool shortPantsToday = false;
  static String province;
  static double temp;
  static List<ForecastItem> forecastItems;

  static Future<bool> initializeData(LocationData locationData) async {
    forecastItems = new List();
    String today =
        DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toLowerCase();
    var response = await http.get(
        "http://kortebroekaan-server.herokuapp.com/api/weatherdata?lat=${locationData.latitude}&lon=${locationData.longitude}");
    var decoded = await jsonDecode(response.body);
    temp = decoded["data"][today]["temp"];
    province = decoded["province"];
    shortPantsToday =
        meetsConditions(temp, decoded["data"][today]["chanceOfRain"]);
    for (var day in Map<String, dynamic>.from(decoded["data"]).keys) {
      if (day != today) {
        forecastItems.add(new ForecastItem(
            day,
            meetsConditions(decoded["data"][day]["temp"].toDouble(),
                decoded["data"][day]["chanceOfRain"])));
      }
    }
    return true;
  }

  static bool meetsConditions(double temp, bool rain) {
    double filterStrength = PreferencesHandler.filterStrength;
    if (filterStrength == 1) return false;
    else if (filterStrength == 2) return !rain && temp > 15;
    else if (filterStrength == 3) return !rain && temp > 10;
    else return true;
  }

  static Color getBackgroundColor() {
    return Color(WeatherHandler.shortPantsToday ? 0xFFFDEBD1 : 0xFFBCCBD8);
  }

  static Color getDarkColor() {
    return Color(WeatherHandler.shortPantsToday ? 0xFFC34F22 : 0xFF125B7F);
  }
}
