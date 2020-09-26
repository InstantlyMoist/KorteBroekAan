import 'package:kan_ik_een_korte_broek_aan/services/database_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences _sharedPreferences;

  static double _filterStrength;
  static double _lastWOEID;
  static bool _celcius;
  static bool _notifications;

  static Future<void> init(int woeID) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _filterStrength = _sharedPreferences.getDouble("filter_strength") ?? 2;
    _celcius = _sharedPreferences.getBool("celcius") ?? true;
    _notifications = _sharedPreferences.getBool("notifications") ?? false;
    _lastWOEID = _sharedPreferences.getDouble("last_WOEID") ?? woeID.toDouble();
    double savedWOEID = await DatabaseService.getWOEID();
    if (notifications) {
      _lastWOEID = woeID.toDouble();
      if (savedWOEID == 0 || savedWOEID != _lastWOEID) {
        if (_lastWOEID != savedWOEID) {
          NotificationService.unsubscribe(); // Now irrelevant
          NotificationService.subscribe(_lastWOEID);
          await DatabaseService.setWOEID(_lastWOEID);
        }
      }
    } else {
      if (savedWOEID != 0) {
        await NotificationService.unsubscribe();
        await DatabaseService.setWOEID(0);
      }
    }

    save();
  }

  static Future<void> save() async {
    _sharedPreferences.setDouble("filter_strength", _filterStrength);
    _sharedPreferences.setDouble("last_WOEID", _lastWOEID);
    _sharedPreferences.setBool("celcius", _celcius);
    _sharedPreferences.setBool("notifications", _notifications);
    double WOEID = await DatabaseService.getWOEID();
    print(WOEID);
    print(_lastWOEID);
    if (_notifications) {
      print("notifications are now $_notifications");
      if (WOEID == 0.0) {
        print("subscribing and shit");
        await DatabaseService.setWOEID(_lastWOEID);
        NotificationService.subscribe(_lastWOEID);
      }
    } else {
      if (WOEID != 0.0) {
        await DatabaseService.removeWOEID();
        NotificationService.unsubscribe();
      }
    }
  }

  static bool getByName(String name) {
    if (name == 'notifications')
      return _notifications;
    else
      return celcius;
  }

  static void toggleByName(String name) {
    if (name == 'notifications')
      notifications = !notifications;
    else
      celcius = !celcius;
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
