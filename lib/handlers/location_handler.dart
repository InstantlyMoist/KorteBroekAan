import 'package:location/location.dart';

class LocationHandler {

  static Future<LocationData> getLocation() async {
    Location location = new Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Not giving permissions...");
        return null;
      }
    }
    return await location.getLocation();
  }
}