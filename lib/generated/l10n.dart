// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `On`
  String get on {
    return Intl.message(
      'On',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon...`
  String get comingSoon {
    return Intl.message(
      'Coming soon...',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Pussy`
  String get filter1 {
    return Intl.message(
      'Pussy',
      name: 'filter1',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get filter2 {
    return Intl.message(
      'Average',
      name: 'filter2',
      desc: '',
      args: [],
    );
  }

  /// `Bold`
  String get filter3 {
    return Intl.message(
      'Bold',
      name: 'filter3',
      desc: '',
      args: [],
    );
  }

  /// `Chuck Norris`
  String get filter4 {
    return Intl.message(
      'Chuck Norris',
      name: 'filter4',
      desc: '',
      args: [],
    );
  }

  /// `fri`
  String get friday {
    return Intl.message(
      'fri',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Can I wear shorts?`
  String get homeTitle {
    return Intl.message(
      'Can I wear shorts?',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `We are currently asking Chuck Norris`
  String get loadingSubtitle {
    return Intl.message(
      'We are currently asking Chuck Norris',
      name: 'loadingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `mon`
  String get monday {
    return Intl.message(
      'mon',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Daily Notifications`
  String get notifications {
    return Intl.message(
      'Daily Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `sat`
  String get saturday {
    return Intl.message(
      'sat',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sensitivity`
  String get sensitivity {
    return Intl.message(
      'Sensitivity',
      name: 'sensitivity',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `sun`
  String get sunday {
    return Intl.message(
      'sun',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `thu`
  String get thursday {
    return Intl.message(
      'thu',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `tue`
  String get tuesday {
    return Intl.message(
      'tue',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `wed`
  String get wednesday {
    return Intl.message(
      'wed',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Can you wear shorts today?`
  String get loadingTitle {
    return Intl.message(
      'Can you wear shorts today?',
      name: 'loadingTitle',
      desc: '',
      args: [],
    );
  }

  /// `We need your location!`
  String get noLocationTitle {
    return Intl.message(
      'We need your location!',
      name: 'noLocationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Without a location we cannot provide a weather forecast ...`
  String get noLocationSubtitle {
    return Intl.message(
      'Without a location we cannot provide a weather forecast ...',
      name: 'noLocationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Click here to go to your settings`
  String get noLocationButtonText {
    return Intl.message(
      'Click here to go to your settings',
      name: 'noLocationButtonText',
      desc: '',
      args: [],
    );
  }

  /// `*Yes!* You can wear shorts today!\n\nAre you wondering if you can wear shorts?\nDownload the app on: bit.ly/KorteBroekAanAndroid`
  String get shareYes {
    return Intl.message(
      '*Yes!* You can wear shorts today!\n\nAre you wondering if you can wear shorts?\nDownload the app on: bit.ly/KorteBroekAanAndroid',
      name: 'shareYes',
      desc: '',
      args: [],
    );
  }

  /// `*Oh no!* You can't wear shorts today...\n\nAre you wondering when you can wear shorts again?\nDownload the app on: bit.ly/KorteBroekAanAndroid`
  String get shareNo {
    return Intl.message(
      '*Oh no!* You can\'t wear shorts today...\n\nAre you wondering when you can wear shorts again?\nDownload the app on: bit.ly/KorteBroekAanAndroid',
      name: 'shareNo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'messages'),
      Locale.fromSubtags(languageCode: 'nl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}