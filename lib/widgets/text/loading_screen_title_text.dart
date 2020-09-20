import 'package:flutter/cupertino.dart';

class LoadingScreenTitleText extends StatelessWidget {

  final String _text;

  LoadingScreenTitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontSize: 24),
    );
  }
}
