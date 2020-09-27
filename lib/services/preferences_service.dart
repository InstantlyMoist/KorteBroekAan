import 'package:kan_ik_een_korte_broek_aan/services/database_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences _sharedPreferences;

  static double _filterStrength;
  static double _lastWOEID;
  static bool _celcius;
  static bool _notifications;
  static bool _notificationsToggled;

  static Future<void> init(int woeID) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _filterStrength = _sharedPreferences.getDouble("filter_strength") ?? 2;
    _celcius = _sharedPreferences.getBool("celcius") ?? true;
    _notifications = _sharedPreferences.getBool("notifications") ?? false;
    _lastWOEID = _sharedPreferences.getDouble("last_WOEID") ?? woeID.toDouble();
    _notificationsToggled = false;
    if (_notifications) {
      NotificationService.unsubscribe();
      NotificationService.subscribe(_lastWOEID);
      await DatabaseService.setWOEID(_lastWOEID);
    } else {
      NotificationService.unsubscribe();
      await DatabaseService.removeWOEID(_lastWOEID);
    }
    save();
  }

  static Future<void> save() async {
    _sharedPreferences.setDouble("filter_strength", _filterStrength);
    _sharedPreferences.setDouble("last_WOEID", _lastWOEID);
    _sharedPreferences.setBool("celcius", _celcius);
    _sharedPreferences.setBool("notifications", _notifications);

    if (!_notificationsToggled) return;

    if (_notifications) {
        await DatabaseService.setWOEID(_lastWOEID);
        NotificationService.subscribe(_lastWOEID);
    } else {
      await DatabaseService.removeWOEID(_lastWOEID);
      NotificationService.unsubscribe();
    }

    _notificationsToggled = false;
  }

  static bool getByName(String name) {
    if (name == 'notifications')
      return _notifications;
    else
      return celcius;
  }

  static void toggleByName(String name) {
    if (name == 'notifications') {
      _notificationsToggled = true;
      notifications = !notifications;
    } else
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
