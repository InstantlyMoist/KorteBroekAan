import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/preferences_handler.dart';
import 'package:kan_ik_een_korte_broek_aan/text/subtitletext.dart';
import 'package:kan_ik_een_korte_broek_aan/text/titletext.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();

  VoidCallback forceReload;

  Header({this.forceReload});

}

class _HeaderState extends State<Header> {
  final String subtitleColor = "0xFF717A82";

  String tempString;

  @override
  void initState() {
    super.initState();
    double temp = WeatherHandler.temp;
    bool celcius = PreferencesHandler.getBoolField("celcius");
    if (celcius) tempString = "${temp.toStringAsFixed(1)}C°";
    else tempString = "${(temp * 1.8 + 32).toStringAsFixed(1)}F°";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(
            text: "Kan ik een korte broek aan?",
            color: Color(0xFF2F4859),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SubtitleText(text: WeatherHandler.province),
              SizedBox(width: 15),
              SubtitleText(text: tempString),
              SizedBox(width: 12),
              GestureDetector(
                child: Icon(
                  Icons.refresh,
                  size: 16,
                  color: Color(0xFF717A82),
                ),
                onTap: () => widget.forceReload(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
