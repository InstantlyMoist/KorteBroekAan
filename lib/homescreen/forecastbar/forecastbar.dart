import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/forecastbar/forecastitem.dart';

// ignore: must_be_immutable
class ForecastBar extends StatelessWidget {
  // Day names
  Map<String, dynamic> data = jsonDecode("{\"di\": false, \"wo\": true, \"do\": true,\"vr\": false,\"za\": true,\"zo\": false,\"ma\": true}");


  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15),
          boxShadow: [
            new BoxShadow(
              color: Color(0xFF000000).withOpacity(0.05),
              offset: new Offset(0.0, 5.0),
              blurRadius: 35,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (String day in data.keys) ForecastItem(day, data[day])
          ]
        ),
    );
  }
}