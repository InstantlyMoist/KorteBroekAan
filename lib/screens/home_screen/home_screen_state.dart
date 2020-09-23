import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/data/localization_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/forecase_bar/forecast_bar.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/header/header.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/images/weather_image.dart';

class HomeScreenState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color : AppColor.BLUELIGHT.color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Header(LocalizationService.of(context).homeTitle, "${WeatherService.getCurrentTemp().toStringAsFixed(1)}${PreferencesService.celcius ? "°C" : "°F" }"),
              Expanded(child: WeatherImage()),
              ForecastBar()
            ],
          ),
        ),
      ),
    );
  }
}