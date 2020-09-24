import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/data/app_color.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';

class ForecastItem extends StatelessWidget {
  final bool _meetsRequirements;
  final String _weekDay;

  ForecastItem(this._meetsRequirements, this._weekDay);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            _meetsRequirements ? Icons.done : Icons.do_not_disturb,
            color: AppColor.BLUELIGHTERTHANDARK.color,
            size: 20,
          ),
          SizedBox(
            height: 5,
          ),
          Subtitletext(
            text: _weekDay,
            color: AppColor.BLUELIGHTERTHANDARK.color,
          )
        ],
      ),
    );
  }
}
