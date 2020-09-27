import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/providers/localization_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';
import 'package:share/share.dart';

class Header extends StatelessWidget {
  final String _titleText;
  final String _subTitleText;
  bool _shareable = false;
  bool _multiline;

  Header(this._titleText, this._subTitleText, this._shareable, this._multiline);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(text: _titleText),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Subtitletext(text: _subTitleText, multiline: _multiline,),
            SizedBox(
              width: 10,
            ),
            _shareable
                ? Container(
                    padding: EdgeInsets.zero,
                    width: 16,
                    height: 16,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        FirebaseAnalytics().logEvent(name: "share");
                        Share.share(WeatherService.getDay(0)
                            ? LocalizationProvider.localizationService.shareYes
                            : LocalizationProvider.localizationService.shareNo);
                      },
                      icon: Icon(
                        Icons.share,
                        size: 16,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
