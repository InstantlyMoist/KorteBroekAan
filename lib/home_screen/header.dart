import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/text/subtitletext.dart';
import 'package:kan_ik_een_korte_broek_aan/text/titletext.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class Header extends StatelessWidget {
  final String subtitleColor = "0xFF717A82";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(text: "Kan ik een korte broek aan?"),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SubtitleText(text: WeatherHandler.province),
              SizedBox(width: 15),
              SubtitleText(text: WeatherHandler.temp.toString() + "C°"),
              SizedBox(width: 12),
              GestureDetector(
                child: Icon(Icons.refresh, size: 16, color: Color(0xFF717A82),),
                onTap: () => { print('tap')},
              ),
            ],
          )
        ],
      ),
    );
  }
}
