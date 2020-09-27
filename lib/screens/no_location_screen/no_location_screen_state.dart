import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/components/faded_route_builder.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/main.dart';
import 'package:kan_ik_een_korte_broek_aan/providers/localization_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/screens/home_screen/components/header/header.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class NoLocationScreenState extends StatefulWidget {

  @override
  _NoLocationScreenStateState createState() => _NoLocationScreenStateState();
}

class _NoLocationScreenStateState extends State<NoLocationScreenState> with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed) return;
    loc.Location location = new loc.Location();
    loc.PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted != loc.PermissionStatus.granted) return;
    Navigator.of(context).pushAndRemoveUntil(
        FadedRouteBuilder(page: MyApp()),
            (Route<dynamic> route) => false);
    print(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FirebaseAnalytics().setCurrentScreen(screenName: "no_location");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BLUELIGHT.color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 45, top: 45, right: 40, left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Header(LocalizationProvider.localizationService.noLocationTitle, LocalizationProvider.localizationService.noLocationSubtitle, false, true),
              Expanded(
                child: Image(
                  image: AssetImage("assets/images/no-man-plain.png"),
                ),
              ),
              FlatButton(
                onPressed: () => {
                  openAppSettings(),
                },
                child: Text(LocalizationProvider.localizationService.noLocationButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
