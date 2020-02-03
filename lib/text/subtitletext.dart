import 'package:flutter/cupertino.dart';

class SubtitleText extends StatelessWidget {

  String text;

  SubtitleText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: Color(0xFF717A82)
      ),
    );
  }
}