import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';

class Subtitletext extends StatelessWidget {
   final String text;
   Color color = AppColor.BLUELIGHTERTHANDARK.color;
   bool multiline;

  Subtitletext({this.text, this.color, this.multiline = false});

  @override
  Widget build(BuildContext context) {
    return multiline ? Expanded(
      child: Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    ) : Text(
      text,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
    );
  }
}
