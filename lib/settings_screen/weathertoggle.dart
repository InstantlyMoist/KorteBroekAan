import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kan_ik_een_korte_broek_aan/text/smalltext.dart';
import 'package:kan_ik_een_korte_broek_aan/weather_handler.dart';

class WeatherToggle extends StatefulWidget {
  @override
  _WeatherToggleState createState() => _WeatherToggleState();

  String text;
  String firstOption;
  String secondOption;

  WeatherToggle({this.text, this.firstOption, this.secondOption});
}

class _WeatherToggleState extends State<WeatherToggle> {

  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SmallText(
            text: widget.text,
            color: WeatherHandler.getBackgroundColor(),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => setState(() {
              state = !state;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: WeatherHandler.getBackgroundColor(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                width: 100,
                height: 40,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 100),
                      left: state ? 2 : 50,
                      bottom: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: WeatherHandler.getDarkColor(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 48,
                        height: 36,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 40,
                          child: Align(
                            alignment: Alignment.center,
                            child: SmallText(
                              text: widget.firstOption,
                              color: WeatherHandler.getBackgroundColor(),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 40,
                          child: Align(
                            alignment: Alignment.center,
                            child: SmallText(
                              text: widget.secondOption,
                              color: WeatherHandler.getBackgroundColor(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
