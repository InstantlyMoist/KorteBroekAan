import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class BasePopup extends StatelessWidget {
  String headerTitle;
  Widget child;

  BasePopup({this.child, this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ), //this right here
      child: Container(
        margin: EdgeInsets.all(5),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: WeatherHandler.getDarkColor(),
              ),
              width: double.infinity,
              height: 48,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Informatie over filters",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: this.child,
            ),
          ],
        ),
      ),
    );
  }
}
