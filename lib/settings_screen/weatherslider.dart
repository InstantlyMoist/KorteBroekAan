import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/preferences_handler.dart';
import 'package:kan_ik_een_korte_broek_aan/text/smalltext.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class WeatherSlider extends StatefulWidget {
  @override
  _WeatherSliderState createState() => _WeatherSliderState();
}

class _WeatherSliderState extends State<WeatherSlider> {
  double sliderValue = 1;

  @override
  void initState() {
    super.initState();
    sliderValue = PreferencesHandler.filterStrength;
  }

  void updateSlider(double newValue) {
    setState(() {
      PreferencesHandler.setFilterStrength(newValue);
      this.sliderValue = newValue;
    });
  }

  String getFilterName() {
    int comparable = sliderValue.toInt();
    if (comparable == 1)
      return "Watje";
    else if (comparable == 2)
      return "Gemiddeld";
    else if (comparable == 3)
      return "Gedurfd";
    else
      return "Piet Paulusma";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SmallText(
                text: "Gevoeligheidsgraad",
                color: WeatherHandler.getBackgroundColor(),
              ),
              Row(
                children: <Widget>[
                  SmallText(
                      text: getFilterName(),
                      color: WeatherHandler.getBackgroundColor()),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 14,
                    color: WeatherHandler.getBackgroundColor(),
                  ),
                ],
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: WeatherHandler.getBackgroundColor().withOpacity(0.2),
              inactiveTrackColor:
                  WeatherHandler.getBackgroundColor().withOpacity(0.2),
              activeTickMarkColor: WeatherHandler.getBackgroundColor(),
              inactiveTickMarkColor: WeatherHandler.getBackgroundColor(),
              thumbColor: WeatherHandler.getBackgroundColor(),
            ),
            child: Slider(
                onChanged: (newValue) => updateSlider(newValue),
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
