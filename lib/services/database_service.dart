import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';

class DatabaseService {
  static FirebaseFirestore _db;
  static CollectionReference _devices;
  static DocumentReference _device;

  static Future<void> init() async {
    _db = FirebaseFirestore.instance;
    _devices = _db.collection("devices");
    _device = _devices.doc(await _getId());
    return;
  }

  static Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
    }
  }

  static Future<void> setWOEID(double WOEID) async {
    await _device.set({"WOEID": WOEID});
    return;
  }

  static Future<void> removeWOEID() async {
    return await _device.delete();
  }

  static Future<double> getWOEID() async {
    DocumentSnapshot response = await _device.get();
    if (!response.exists) return 0;
    return await response.get('WOEID').toDouble();
  }
}
