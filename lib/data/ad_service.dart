import 'dart:io';

class AdService {

  static String getAdMobAppID() {
    return Platform.isIOS ? "NOT_IMPLEMENTED" : "ca-app-pub-1364717858891314~7329627897";
  }

  static String getBannerAdID() {
    return Platform.isIOS ? "NOT_IMPLEMENTED" : "ca-app-pub-1364717858891314/6730862092";
  }

}