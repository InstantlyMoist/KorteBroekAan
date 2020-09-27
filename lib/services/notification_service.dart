import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kan_ik_een_korte_broek_aan/providers/locale_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/services/localization_service.dart';

class NotificationService {
  static FirebaseMessaging _firebaseMessaging;

  static Future<void> init() async {
    _firebaseMessaging = new FirebaseMessaging();
    print(await _firebaseMessaging.getToken());
  }

  static void subscribe(double topic) async {
    await FirebaseAnalytics().setUserProperty(name: "woeid", value: topic.toInt().toString());
    await FirebaseAnalytics().logEvent(name: "woeidChange");
    _firebaseMessaging.subscribeToTopic(
        "${topic.toInt().toString()}_${LocaleProvider.isDutch() ? "nl" : "en"}");
  }

  static Future<void> unsubscribe() async {
    await FirebaseAnalytics().setUserProperty(name: "woeid", value: 0.toString());
    await FirebaseAnalytics().logEvent(name: "woeidChange");
    await _firebaseMessaging.deleteInstanceID();
    return;
  }
}
