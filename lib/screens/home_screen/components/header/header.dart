import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(text: "Kan ik een korte broek aan?"),
        SizedBox(height: 5,),
        Subtitletext(text: "${WeatherService.currentTemp}°C"),
      ],
    );
  }
}