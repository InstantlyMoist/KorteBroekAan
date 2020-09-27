import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/providers/localization_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/services/ad_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/home_screen_state.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/settings_screen/components/settings_slider.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/settings_screen/components/settings_toggle.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreenState extends StatefulWidget {
  @override
  _SettingsScreenStateState createState() => _SettingsScreenStateState();
}

class _SettingsScreenStateState extends State<SettingsScreenState> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics().setCurrentScreen(screenName: "settings");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await PreferencesService.save();
        WeatherService.handleResponse();
        Navigator.of(context).pushAndRemoveUntil(
            FadedRouteBuilder(page: HomeScreenState()),
            (Route<dynamic> route) => false);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: WeatherService.getDay(0)
            ? AppColor.ORANGEDARK.color
            : AppColor.BLUEDARK.color,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 45, right: 40, left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).maybePop();
                      },
                      child: Icon(Icons.arrow_back,
                          color: WeatherService.getDay(0)
                              ? AppColor.ORANGELIGHT.color
                              : AppColor.BLUELIGHT.color),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TitleText(
                      text: LocalizationProvider.localizationService.settings,
                      color: WeatherService.getDay(0)
                          ? AppColor.ORANGELIGHT.color
                          : AppColor.BLUELIGHT.color,
                    ),
                  ],
                ),
                SettingsSlider(),
                SettingsToggle(LocalizationProvider.localizationService.unit, "°C", "°F",
                    "celcius", false),
                SettingsToggle(LocalizationProvider.localizationService.notifications,
                  LocalizationProvider.localizationService.on, LocalizationProvider.localizationService.off, "notifications", false),
                Spacer(),
                Row(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(90),
                      onTap: () async {
                        await launch("https://github.com/InstantlyMoist/KorteBroekAan");
                      },
                      child: Image(
                        image: AssetImage("assets/images/github.png"),
                        height: 38,
                        width: 38,
                        color: WeatherService.getDay(0)
                            ? AppColor.ORANGELIGHT.color
                            : AppColor.BLUELIGHT.color,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(90),
                      onTap: () async {
                        await launch(Platform.isAndroid ? "https://play.google.com/store/apps/details?id=moldovo.kan_ik_een_korte_broek_aan" : "NOT_IMPLEMENTED");
                      },
                      child: Icon(Icons.star,
                          size: 38,
                          color: WeatherService.getDay(0)
                              ? AppColor.ORANGELIGHT.color
                              : AppColor.BLUELIGHT.color),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                AdmobBanner(
                  adUnitId: AdService.getBannerAdID(),
                  adSize: AdmobBannerSize.BANNER,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
