import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';

class Subtitletext extends StatelessWidget {
   final String text;
   Color color = AppColor.BLUELIGHTERTHANDARK.color;

  Subtitletext({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
    );
  }
}
