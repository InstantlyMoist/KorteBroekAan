import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/forecastbar/forecastitem.dart';

class WeatherHandler {

  static bool shortPantsToday = false;
  static String province;
  static double temp;
  static List<ForecastItem> forecastItems = new List();
  //static Map<String, dynamic> forecast = ;

  static Future<bool> initializeData() async {
    String today = DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toLowerCase();
    var response = await http.get("http://kortebroekaan-server.herokuapp.com/api/weatherdata?lat=51.6062059&lon=4.7451539");
    var decoded = await jsonDecode(response.body);
    temp = decoded["data"][today]["temp"];
    province = decoded["province"];
    shortPantsToday = meetsConditions(temp, decoded["data"][today]["chanceOfRain"]);
    for (var day in Map<String, dynamic>.from(decoded["data"]).keys) {
      if (day != today) {
        forecastItems.add(new ForecastItem(day, meetsConditions(decoded["data"][day]["temp"], decoded["data"][day]["chanceOfRain"])));
      }
    }
    return true;
  }

  static bool meetsConditions(double temp, bool rain) {
    return !rain && temp > 10;
  }

}