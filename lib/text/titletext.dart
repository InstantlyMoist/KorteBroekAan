import 'package:flutter/cupertino.dart';

class TitleText extends StatelessWidget {

  String text;

  TitleText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2F4859)
      ),
    );
  }
}