import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';

class TitleText extends StatelessWidget {

  String text;
  Color color = AppColor.BLUEDARKER.color;

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
