import 'package:flutter/cupertino.dart';

class WeatherImage extends StatelessWidget {

  bool shortPants = true;


  WeatherImage(this.shortPants);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image(
        image: AssetImage(shortPants ? 'assets/images/yes-man.png' : 'assets/images/no-man.png'),
      ),
    );
  }
}
