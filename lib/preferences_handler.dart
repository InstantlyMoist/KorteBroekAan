import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHandler {
  static SharedPreferences preferences;

  static double _filterStrength;

  static bool _celcius;
  static bool _notifications;

  static void load() async {
    preferences = await SharedPreferences.getInstance();
    await fetchData();
    preferences.setDouble("filterStrength", _filterStrength);
    preferences.setBool("celcius", _celcius);
    preferences.setBool("notifications", _notifications);
    return;
  }

  static void fetchData() async {
    _filterStrength = (preferences.getDouble("filterStrength") ?? 1);
    _celcius = (preferences.getBool("celcius") ?? true);
    _notifications = (preferences.getBool("notifications") ?? true);
  }

  static void setFilterStrength(double newStrength) {
    WeatherHandler.settingsHandled = false;
    preferences.setDouble("filterStrength", newStrength);
    fetchData();
  }

  static void setBoolField(String name, bool value) {
    WeatherHandler.settingsHandled = false;
    preferences.setBool(name, value);
    fetchData();
  }

  static bool getBoolField(String name) {
    return preferences.getBool(name);
  }

  static bool get notifications => _notifications;

  static bool get celcius => _celcius;

  static double get filterStrength => _filterStrength;


}
