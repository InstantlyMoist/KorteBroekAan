import 'package:flutter/cupertino.dart';

class ForecastItem extends StatelessWidget {
  String day;

  ForecastItem(String day) : this.day = day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            day.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFCCCCCC)
            ),
          )
        ],
      ),
    );
  }

}