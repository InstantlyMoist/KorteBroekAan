import 'package:flutter/cupertino.dart';

enum AppColor {
  ORANGELIGHT,
  ORANGEDARK,
  BLUELIGHT,
  BLUELIGHTERTHANDARK,
  BLUEDARK,
  BLUEDARKER,
}

extension AppColorExtension on AppColor {
  Color get color {
    switch(this) {
      case AppColor.BLUEDARK:
        return Color(0xFF125B7F);
      case AppColor.BLUELIGHT:
        return Color(0xFFBCCBD8);
      case AppColor.ORANGEDARK:
        return Color(0xFFC34F22);
      case AppColor.ORANGELIGHT:
        return Color(0xFFFDEBD1);
      case AppColor.BLUEDARKER:
        return Color(0xFF2F4859);
      case AppColor.BLUELIGHTERTHANDARK:
        return Color(0xFF717A82);
    }
  }
}