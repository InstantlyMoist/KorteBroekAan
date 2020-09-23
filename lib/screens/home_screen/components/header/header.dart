import 'package:flutter/cupertino.dart';
import 'package:kan_ik_een_korte_broek_aan/data/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';

class Header extends StatelessWidget {

  final String _titleText;
  final String _subTitleText;


  Header(this._titleText, this._subTitleText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(text: _titleText),
        SizedBox(height: 5,),
        Subtitletext(text: _subTitleText),
      ],
    );
  }
}