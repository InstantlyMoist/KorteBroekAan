
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/services/localization_service.dart';

class ShareService {

  static String _shareYes;
  static String _shareNo;

  static void init() async {
    final Locale myLocale = Locale(Platform.localeName);

    LocalizationService service = await LocalizationService.load(myLocale);
    _shareYes = service.shareYes;
    _shareNo = service.shareNo;
  }

  static String get shareNo => _shareNo;

  static String get shareYes => _shareYes;

}