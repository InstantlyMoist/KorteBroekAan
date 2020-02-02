import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/homescreen/forecastbar/forecastitem.dart';

class ForecastBar extends StatelessWidget {
  List<String> days = ["ma","di","wo","do","vr","za","zo"];
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
            for (String day in days) ForecastItem(day)
          ]
        ),
    );
  }
}