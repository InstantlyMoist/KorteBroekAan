import 'package:flutter/cupertino.dart';

class WeatherImage extends StatelessWidget {
  bool shortPants = true;

  WeatherImage(this.shortPants);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
      child: Image(
        image: AssetImage(shortPants
            ? 'assets/images/yes-man.png'
            : 'assets/images/no-man.png'),
      ),
    );
  }
}
