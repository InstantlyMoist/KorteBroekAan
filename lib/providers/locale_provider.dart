import 'dart:io';

import 'package:flutter/cupertino.dart';

class LocaleProvider {

  static Locale getLocale() {
    return Locale(Platform.localeName);
  }

  static bool isDutch() {
    return getLocale().toLanguageTag() == "nl";
  }

}