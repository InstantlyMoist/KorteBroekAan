import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  static SharedPreferences _sharedPreferences;

  static double _filterStrength;
  static double _lastWOEID;
  static bool _celcius;
  static bool _notifications;

  static Future<void> init(int woeID) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    _filterStrength = _sharedPreferences.getDouble("filter_strength") ?? 1;
    _lastWOEID = _sharedPreferences.getDouble("last_WOEID") ?? woeID.toDouble(); // Default to amsterdam... Can be loaded later on.
    if (_lastWOEID != woeID) {
      _lastWOEID = woeID.toDouble();
      // TODO: Change notification service to firebase (Which means unsubscribing to old topic and subscribing to new topic)
    }
    _celcius = _sharedPreferences.getBool("celcius") ?? true;
    _notifications = _sharedPreferences.getBool("notifications") ?? false;

    save();
  }

  static void save() {
    _sharedPreferences.setDouble("filter_strength", _filterStrength);
    _sharedPreferences.setDouble("last_WOEID", _lastWOEID);
    _sharedPreferences.setBool("celcius", _celcius);
    _sharedPreferences.setBool("notifications", _notifications);
  }

  static bool get notifications => _notifications;

  static bool get celcius => _celcius;

  static double get lastWOEID => _lastWOEID;

  static double get filterStrength => _filterStrength;

  static set filterStrength(double value) {
    _filterStrength = value;
  }

  static set lastWOEID(double value) {
    _lastWOEID = value;
  }

  static set celcius(bool value) {
    _celcius = value;
  }

  static set notifications(bool value) {
    _notifications = value;
  }


}