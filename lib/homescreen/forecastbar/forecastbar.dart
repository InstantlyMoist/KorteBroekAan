import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/forecastbar/forecastitem.dart';

// ignore: must_be_immutable
class ForecastBar extends StatelessWidget {
  // Day names
  Map<String, dynamic> data =
      jsonDecode("{\"di\": false, \"wo\": true, \"do\": true,\"vr\": false}");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 5, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (String day in data.keys) ForecastItem(day, data[day]),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                ),
                IconButton(
                  onPressed: () => {
                  },
                  padding: EdgeInsets.only(left: 10, right: 20),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black.withOpacity(0.2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
