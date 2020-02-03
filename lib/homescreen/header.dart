import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/text/subtitletext.dart';
import 'package:kan_ik_een_korte_broek_aan/text/titletext.dart';

class Header extends StatelessWidget {
  final String subtitleColor = "0xFF717A82";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(text: "Kan ik een korte broek aan?"),
          SizedBox(height: 20),
          Row(
            children: <Widget> [
              SubtitleText(text: "Breda"),
              SizedBox(width: 15),
              SubtitleText(text: "14C°")
            ],
          )
        ],
      ),
    );
  }

}