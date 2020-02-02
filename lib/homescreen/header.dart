import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  final String subtitleColor = "0xFF717A82";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Kan ik een korte broek aan?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F4859)
              ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Breda",
                style: TextStyle(
                   fontSize: 16,
                   color: Color(int.parse(subtitleColor))
                ),
              ),
              SizedBox(width: 15),
              Text(
                "14C°",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(int.parse(subtitleColor))
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}