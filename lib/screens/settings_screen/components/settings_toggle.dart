import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/data/localization_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';

class SettingsToggle extends StatefulWidget {
  String title;
  String firstOption;
  String secondOption;
  String preferencesName;
  bool comingSoon;

  SettingsToggle(this.title, this.firstOption, this.secondOption,
      this.preferencesName, this.comingSoon);

  @override
  _SettingsToggleState createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Subtitletext(
            text: widget.title,
            color: WeatherService.getDay(0)
                ? AppColor.ORANGELIGHT.color
                : AppColor.BLUELIGHT.color,
          ),
          SizedBox(
            height: 10,
          ),
          widget.comingSoon
              ? Container(
                  child: Subtitletext(
                      text: LocalizationService.of(context).comingSoon,
                      color: WeatherService.getDay(0)
                          ? AppColor.ORANGELIGHT.color
                          : AppColor.BLUELIGHT.color),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      PreferencesService.toggleByName(widget.preferencesName);
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: WeatherService.getDay(0)
                          ? AppColor.ORANGELIGHT.color
                          : AppColor.BLUELIGHT.color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: PreferencesService.getByName(
                                  widget.preferencesName)
                              ? 2
                              : 50,
                          bottom: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: WeatherService.getDay(0)
                                  ? AppColor.ORANGEDARK.color
                                  : AppColor.BLUEDARK.color,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 48,
                            height: 36,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: Subtitletext(
                                  text: widget.firstOption,
                                  color: WeatherService.getDay(0)
                                      ? AppColor.ORANGELIGHT.color
                                      : AppColor.BLUELIGHT.color,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: Subtitletext(
                                  text: widget.secondOption,
                                  color: WeatherService.getDay(0)
                                      ? AppColor.ORANGELIGHT.color
                                      : AppColor.BLUELIGHT.color,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
