import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/data/localization_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';

class SettingsSlider extends StatefulWidget {

  @override
  _SettingsSliderState createState() => _SettingsSliderState();
}

class _SettingsSliderState extends State<SettingsSlider> {

  double _value = 1;

  String getFilterName() {
    if (_value == 1) return LocalizationService.of(context).filter1;
    if (_value == 2) return LocalizationService.of(context).filter2;
    if (_value == 3) return LocalizationService.of(context).filter3;
    else return LocalizationService.of(context).filter4;
  }

  @override
  void initState() {
    super.initState();
    _value = PreferencesService.filterStrength;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Subtitletext(text: LocalizationService.of(context).sensitivity, color: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color : AppColor.BLUELIGHT.color,),
              Subtitletext(text: getFilterName(), color: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color : AppColor.BLUELIGHT.color,),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackShape: CustomTrackShape(),
              activeTrackColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color.withOpacity(0.2) : AppColor.BLUELIGHT.color.withOpacity(0.2),
              inactiveTrackColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color.withOpacity(0.2) : AppColor.BLUELIGHT.color.withOpacity(0.2),
              activeTickMarkColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color :AppColor.BLUELIGHT.color,
              inactiveTickMarkColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color :AppColor.BLUELIGHT.color,
              thumbColor: WeatherService.getDay(0) ? AppColor.ORANGELIGHT.color :AppColor.BLUELIGHT.color,
            ),
            child: Slider(
              value: _value,
              min: 1,
              max: 4,
              divisions: 3,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  PreferencesService.filterStrength = _value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}