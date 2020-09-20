import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/data/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/handlers/location_handler.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/home_screen_state.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/loading_screen_title_text.dart';
import 'package:location/location.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      title: 'Kan ik een korte broek aan',
      theme: ThemeData(
        fontFamily: 'CircularStd',
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  bool dataReady = false;
  bool meetsRequirements;
  Color currentColor = AppColor.ORANGELIGHT.color;

  void init() async {
    LocationData currentLocation = await LocationHandler.getLocation();
    int woeID = await WeatherService.loadWOEID(currentLocation);
    await PreferencesService.init(woeID);
    bool meetsRequirements = await WeatherService.loadWeatherData(woeID);
    this.meetsRequirements = meetsRequirements;
    dataReady = true;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        currentColor = AppColor.BLUELIGHT.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          onEnd: () async {
            if (dataReady) {
              if (currentColor ==
                  (meetsRequirements
                      ? AppColor.ORANGELIGHT.color
                      : AppColor.BLUELIGHT.color)) {
                Navigator.of(context).pushAndRemoveUntil(
                    FadedRouteBuilder(page: HomeScreenState()),
                    (Route<dynamic> route) => false);
                return;
              }
            }
            setState(() {
              currentColor = currentColor == AppColor.ORANGELIGHT.color
                  ? AppColor.BLUELIGHT.color
                  : AppColor.ORANGELIGHT.color;
            });
          },
          color: currentColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoadingScreenTitleText("Kan je vandaag een korte broek aan?"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("We vragen het even aan Piet Paulusma"),
                    SizedBox(
                      width: 2,
                    ),
                    JumpingDotsProgressIndicator()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
