import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:kan_ik_een_korte_broek_aan/data/device_id.dart';

class DatabaseService {
  static FirebaseFirestore _db;

  static CollectionReference _woeids;

  static CollectionReference _devices;
  static DocumentReference _device;

  static Future<void> init() async {
    _db = FirebaseFirestore.instance;
    _woeids = _db.collection("woeids");

    _devices = _db.collection("devices");
    _device = _devices.doc(await DeviceId.getDeviceId());
    return;
  }

  static Future<void> setWOEID(double WOEID) async {
    DocumentReference reference = _woeids.doc(WOEID.toInt().toString());
    reference.set({
      "users": FieldValue.arrayUnion([await DeviceId.getDeviceId()])
    }, SetOptions(merge: true));
    return;
  }

  static Future<void> removeWOEID(double WOEID) async {
    DocumentReference reference = _woeids.doc(WOEID.toInt().toString());
    String deviceId = await DeviceId.getDeviceId();
    reference.set({
      "users": FieldValue.arrayRemove([deviceId])
    }, SetOptions(merge: true));
    return;
  }
}
