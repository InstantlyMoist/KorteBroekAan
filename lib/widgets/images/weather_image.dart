import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';

class WeatherImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
      child: Image(
        image: AssetImage(WeatherService.getDay(0)
            ? "assets/images/yes-man.png"
            : "assets/images/no-man.png"),
      ),
    );
  }
}