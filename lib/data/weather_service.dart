import 'dart:convert';
import 'dart:collection';
import 'package:kan_ik_een_korte_broek_aan/data/preferences_service.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static final String FIND_WOEID_BASE_URL =
      "https://www.metaweather.com/api/location/search/?lattlong=";
  static final String WEATHER_BASE_URL =
      "https://www.metaweather.com/api/location/";

  static var _cachedResponse;
  static double currentTemp;
  static LinkedList list;

  static loadWOEID(LocationData data) async {
    final String FIND_WOEID_URL =
        '${FIND_WOEID_BASE_URL}${data.latitude},${data.longitude}';
    var response = await http.get(FIND_WOEID_URL);
    var decodedResponse = jsonDecode(response.body);
    return decodedResponse[0]['woeid'];
  }

  static Future<bool> loadWeatherData(int woeID) async {
    final String WEATHER_URL = '${WEATHER_BASE_URL}${woeID}';
    var response = await http.get(WEATHER_URL);
    var decodedResponse = jsonDecode(response.body);
    _cachedResponse = decodedResponse;
    await handleResponse();
    return (list.first as WeatherEntry).value;
  }

  static Future<void> handleResponse() async {
    list = new LinkedList<WeatherEntry>();
    currentTemp = _cachedResponse['consolidated_weather'][0]['the_temp'];
    for (var day in _cachedResponse['consolidated_weather']) {
      list.add(WeatherEntry(meetsRequirements(day['the_temp'], isRain('weather_state_abbr'))));
    }
  }

  static bool getDay(int index) {
    return (list.toList()[index] as WeatherEntry).value;
  }

  static bool meetsRequirements(double temp, bool raining) {
    double filterStrength = PreferencesService.filterStrength;
    if (filterStrength == 1) return false;
    if (filterStrength == 2) return !raining && temp > 15;
    if (filterStrength == 3) return !raining && temp > 10;
    else return true;
  }

  static bool isRain(String weatherState) {
    return weatherState == "sn" ||
        weatherState == "sl" ||
        weatherState == "h" ||
        weatherState == "t" ||
        weatherState == "hr" ||
        weatherState == "lr" ||
        weatherState == "S";
  }

  static int getWeekDay(int weekDay) {
    return weekDay > 7 ? weekDay - 7 : weekDay;
  }

  static String getWeekdayString(int weekDay) {
    weekDay = getWeekDay(weekDay);
    switch (weekDay) {
      case 1: return "ma";
      case 2: return "di";
      case 3: return "wo";
      case 4: return "do";
      case 5: return "vr";
      case 6: return "za";
      case 7: return "zo";
    }
  }
}

class WeatherEntry extends LinkedListEntry<WeatherEntry>{
  final bool meetsRequirements;

  WeatherEntry(this.meetsRequirements);

  @override
  String toString() {
    return '$meetsRequirements';
  }
}

extension WeatherEntryExtension on WeatherEntry {
  bool get value {
    return this.meetsRequirements;
  }
}
