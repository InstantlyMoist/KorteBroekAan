import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/services/localization_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/share_service.dart';
import 'package:kan_ik_een_korte_broek_aan/services/weather_service.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/subtitle_text.dart';
import 'package:kan_ik_een_korte_broek_aan/widgets/text/title_text.dart';
import 'package:share/share.dart';

class Header extends StatelessWidget {
  final String _titleText;
  final String _subTitleText;
  bool _shareable = false;

  Header(this._titleText, this._subTitleText, this._shareable);

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
            Subtitletext(text: _subTitleText),
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
                        print(ShareService.shareYes);
                        Share.share(WeatherService.getDay(0)
                            ? ShareService.shareYes
                            : ShareService.shareNo);
                        // actually share shit
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
