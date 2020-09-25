import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'file:///C:/Users/Kylli/StudioProjects/KorteBroekAan/lib/services/localization_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/forecase_bar/forecast_item.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/settings_screen/settings_screen_state.dart';

class ForecastBar extends StatefulWidget {
  @override
  _ForecastBarState createState() => _ForecastBarState();
}

class _ForecastBarState extends State<ForecastBar> {
  List<ForecastItem> _forecastItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _forecastItems = new List();
    DateTime today = DateTime.now();
    for (int i = 1; i != WeatherService.list.length; i++) {
      int weekDay = WeatherService.getWeekDay(today.weekday + i);
      _forecastItems.add(
        ForecastItem(
          WeatherService.getDay(i),
          WeatherService.getWeekdayString(weekDay, context),
        ),
      );
    }
  }

  void handleMenuTap(String value) {
    if (value == "0") {
      Navigator.of(context).pushAndRemoveUntil(
          FadedRouteBuilder(page: SettingsScreenState()),
          (Route<dynamic> route) => false);
    }
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Container(
        height: 64,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (ForecastItem item in _forecastItems) item,
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    width: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            FadedRouteBuilder(page: SettingsScreenState()),
                                (Route<dynamic> route) => false);
                      },
                      icon: Icon(Icons.settings, color: AppColor.BLUELIGHTERTHANDARK.color,),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
