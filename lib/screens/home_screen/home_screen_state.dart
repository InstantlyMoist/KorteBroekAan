import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/providers/localization_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/services/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/forecase_bar/forecast_bar.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/header/header.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/images/weather_image.dart';

class HomeScreenState extends StatefulWidget {
  @override
  _HomeScreenStateState createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics().setCurrentScreen(screenName: "home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeatherService.getDay(0)
          ? AppColor.ORANGELIGHT.color
          : AppColor.BLUELIGHT.color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Header(
                  LocalizationProvider.localizationService.homeTitle,
                  "${WeatherService.getCurrentTemp().toStringAsFixed(1)}${PreferencesService.celcius ? "°C" : "°F"}",
                  true, false),
              Expanded(child: WeatherImage()),
              ForecastBar()
            ],
          ),
        ),
      ),
    );
  }
}
