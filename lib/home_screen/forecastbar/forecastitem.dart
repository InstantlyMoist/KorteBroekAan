import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForecastItem extends StatelessWidget {
  String day;
  bool prediction;

  ForecastItem(String day, bool prediction) : this.day = day, this.prediction = prediction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            prediction ? Icons.done : Icons.do_not_disturb,
            color: Color(0xFFCCCCCC),
            size: 20.0,
          ),
          SizedBox(height: 5),
          AutoSizeText(
            day.toUpperCase(),
            minFontSize: 4,
            maxFontSize: 11,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFCCCCCC)
            ),
          ),
        ],
      ),
    );
  }

}