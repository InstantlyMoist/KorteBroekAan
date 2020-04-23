import 'package:flutter/cupertino.dart';

class TitleText extends StatelessWidget {

  String text;
  Color color;

  TitleText({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: color,
      ),
    );
  }
}