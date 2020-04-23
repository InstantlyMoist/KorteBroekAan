import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class WeatherSlider extends StatefulWidget {
  @override
  _WeatherSliderState createState() => _WeatherSliderState();
}

class _WeatherSliderState extends State<WeatherSlider> {

  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("ok"),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color(WeatherHandler.shortPantsToday
                  ? 0xFFFDEBD1
                  : 0xFFBCCBD8)
                  .withOpacity(0.2),
              inactiveTrackColor: Color(WeatherHandler.shortPantsToday
                  ? 0xFFFDEBD1
                  : 0xFFBCCBD8)
                  .withOpacity(0.2),
              activeTickMarkColor: Color(WeatherHandler.shortPantsToday
                  ? 0xFFFDEBD1
                  : 0xFFBCCBD8),
              inactiveTickMarkColor: Color(WeatherHandler.shortPantsToday
                  ? 0xFFFDEBD1
                  : 0xFFBCCBD8),
              thumbColor: Color(WeatherHandler.shortPantsToday
                  ? 0xFFFDEBD1
                  : 0xFFBCCBD8),
            ),
            child: Slider(
                onChanged: (newState) => setState(() {
                  sliderValue = newState;
                  print(newState);
                }),
                value: sliderValue,
                min: 1,
                max: 4,
                divisions: 3),
          ),
        ],
      ),
    );
  }
}