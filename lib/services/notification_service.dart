import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {

  static FirebaseMessaging _firebaseMessaging;

  static Future<void> init() async {
    _firebaseMessaging = new FirebaseMessaging();
    print(await _firebaseMessaging.getToken());
  }

  static void subscribe(double topic) {
    _firebaseMessaging.subscribeToTopic(topic.toInt().toString());
  }

  static Future<void> unsubscribe() async {
    await _firebaseMessaging.deleteInstanceID();
    return;
  }
}