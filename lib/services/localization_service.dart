import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/l10n/messages_all.dart';

class LocalizationService {
  LocalizationService(this.localeName);

  static Future<LocalizationService> load(Locale locale) {
    final String name =
        locale.countryCode?.isEmpty ?? false ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return LocalizationService(localeName);
    });
  }

  static LocalizationService of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService);
  }

  final String localeName;

  String get comingSoon {
    return Intl.message(
      "Komt binnenkort...",
      name: "comingSoon",
      locale: localeName,
    );
  }

  String get filter1 {
    return Intl.message(
      "Watje",
      name: "filter1",
      locale: localeName,
    );
  }

  String get filter2 {
    return Intl.message(
      "Gemiddeld",
      name: "filter2",
      locale: localeName,
    );
  }

  String get filter3 {
    return Intl.message(
      "Gedurfd",
      name: "filter3",
      locale: localeName,
    );
  }

  String get filter4 {
    return Intl.message(
      "Piet Paulusma",
      name: "filter4",
      locale: localeName,
    );
  }

  String get friday {
    return Intl.message(
      "vr",
      name: "friday",
      locale: localeName,
    );
  }

  String get homeTitle {
    return Intl.message(
      "Kan ik een korte broek aan?",
      name: "homeTitle",
      locale: localeName,
    );
  }

  String get loadingSubtitle {
    return Intl.message(
      "We vragen het even aan piet paulusma",
      name: "loadingSubtitle",
      locale: localeName,
    );
  }

  String get monday {
    return Intl.message(
      "ma",
      name: "monday",
      locale: localeName,
    );
  }

  String get notifications {
    return Intl.message(
      "Dagelijkse Notificaties",
      name: "notifications",
      locale: localeName,
    );
  }

  String get saturday {
    return Intl.message(
      "za",
      name: "saturday",
      locale: localeName,
    );
  }

  String get sensitivity {
    return Intl.message(
      "Gevoeligheidsgraad",
      name: "sensitivity",
      locale: localeName,
    );
  }

  String get settings {
    return Intl.message(
      "Instellingen",
      name: "settings",
      locale: localeName,
    );
  }

  String get sunday {
    return Intl.message(
      "zo",
      name: "sunday",
      locale: localeName,
    );
  }

  String get thursday {
    return Intl.message(
      "do",
      name: "thursday",
      locale: localeName,
    );
  }

  String get tuesday {
    return Intl.message(
      "di",
      name: "tuesday",
      locale: localeName,
    );
  }

  String get unit {
    return Intl.message(
      "Eenheid",
      name: "unit",
      locale: localeName,
    );
  }

  String get wednesday {
    return Intl.message(
      "wo",
      name: "wednesday",
      locale: localeName,
    );
  }

  String get loadingTitle {
    return Intl.message(
      "Kan je vandaag een korte broek aan?",
      name: "loadingTitle",
      locale: localeName,
    );
  }

  String get share {
    return Intl.message(
      "Delen",
      name: "share",
      locale: localeName,
    );
  }

  String get noLocationTitle {
    return Intl.message(
      "We hebben je locatie nodig!",
      name: "noLocationTitle",
      locale: localeName,
    );
  }

  String get noLocationSubtitle {
    return Intl.message(
      "Zonder locatie kunnen we geen weersvoorspelling geven...",
      name: "noLocationSubtitle",
      locale: localeName,
    );
  }

  String get noLocationButtonText {
    return Intl.message(
      "Klik hier om naar je instellingen te gaan",
      name: "noLocationButtonText",
      locale: localeName,
    );
  }

  String get shareYes {
    return Intl.message(
      "*Yes!* Vandaag kan je een korte broek aan!\n\nBen jij ook benieuwd of je een korte broek aan kunt doen?\nDownload dan snel de app op: bit.ly/KorteBroekAanAndroid",
      name: "shareYes",
      locale: localeName
    );
  }

  String get shareNo {
    return Intl.message(
        "*Helaas!* Vandaag kan je geen een korte broek aan...\n\nBen jij benieuwd wanneer je wel weer een korte broek aan kunt doen?\nDownload dan snel de app op: bit.ly/KorteBroekAanAndroid",
        name: "shareNo",
        locale: localeName
    );
  }
}

class LocalizationServiceDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<LocalizationService> load(Locale locale) =>
      LocalizationService.load(locale);

  @override
  bool shouldReload(LocalizationServiceDelegate old) => false;
}
