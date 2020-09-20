import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/home_screen_state.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/settings_screen/components/settings_slider.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';

class SettingsScreenState extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        WeatherService.handleResponse();
        Navigator.of(context).pushAndRemoveUntil(
            FadedRouteBuilder(page: HomeScreenState()),
                (Route<dynamic> route) => false);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: WeatherService.getDay(0) ? AppColor.ORANGEDARK.color : AppColor.BLUEDARK.color,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(text: "Instellingen", color: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color : AppColor.BLUELIGHT.color,),
                SettingsSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}