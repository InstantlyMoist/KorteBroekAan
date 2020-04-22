import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherHandler {

  static bool shortPantsToday = false;

  static Future<bool> initializeData() async {
    String today = DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toLowerCase();
    var response = await http.get("http://kortebroekaan-server.herokuapp.com/api/weatherdata?lat=51.6062059&lon=4.7451539");
    var decoded = jsonDecode(response.body);
    shortPantsToday = meetsConditions(decoded[today]["temp"], decoded[today]["chanceOfRain"]);
    return true;
  }

  static bool meetsConditions(double temp, bool rain) {
    return !rain && temp > 10;
  }

}