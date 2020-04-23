import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {

  String text;
  Color color;

  SmallText({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }


}