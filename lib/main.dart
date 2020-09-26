import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'file:///C:/Users/Kylli/StudioProjects/KorteBroekAan/lib/services/ad_service.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/services/database_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/notification_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/share_service.dart';
import 'file:///C:/Users/Kylli/StudioProjects/KorteBroekAan/lib/services/localization_service.dart';
import 'file:///C:/Users/Kylli/StudioProjects/KorteBroekAan/lib/services/preferences_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/handlers/location_handler.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/home_screen_state.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/no_location_screen/no_location_screen_state.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/loading_screen_title_text.dart';
import 'package:location/location.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MaterialApp(
      localizationsDelegates: [
        const LocalizationServiceDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('nl', ''), // Dutch
      ],
      home: MyApp(),
      title: 'Kan ik een korte broek aan',
      theme: ThemeData(
        //fontFamily: 'CircularStd',
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  bool dataReady = false;
  bool meetsRequirements;
  bool noLocation = false;
  Color currentColor = AppColor.ORANGELIGHT.color;

  void fail() {
    dataReady = true;
    this.meetsRequirements = false;
    noLocation = true;
  }

  void init() async {
    Firebase.initializeApp();
    Admob.initialize(AdService.getAdMobAppID());

    LocationData currentLocation = await LocationHandler.getLocation();
    if (currentLocation == null) {
      fail();
      return;
    }
    int woeID = await WeatherService.loadWOEID(currentLocation);
    await NotificationService.init();
    await DatabaseService.init();
    await PreferencesService.init(woeID);
    this.meetsRequirements = await WeatherService.loadWeatherData(woeID);
    ShareService.init();
    dataReady = true;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FirebaseAnalytics().setCurrentScreen(screenName: "loading");
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
      body: AnimatedContainer(
        color: currentColor,
        duration: Duration(seconds: 1),
        onEnd: () async {
          if (dataReady) {
            if (currentColor ==
                (meetsRequirements
                    ? AppColor.ORANGELIGHT.color
                    : AppColor.BLUELIGHT.color)) {
              Navigator.of(context).pushAndRemoveUntil(
                  FadedRouteBuilder(
                      page: noLocation
                          ? NoLocationScreenState()
                          : HomeScreenState()),
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
        child: Container(
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoadingScreenTitleText(LocalizationService.of(context).loadingTitle),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(LocalizationService.of(context).loadingSubtitle),
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
