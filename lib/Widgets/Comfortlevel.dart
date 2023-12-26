// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/model/CurrentWeather.dart';

class ComfortLevel extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  const ComfortLevel({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: Text(
            'Comfort Level',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: currentWeatherData.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      infoProperties:
                          InfoProperties(bottomLabelText: 'Humidity'),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(progressBarColors: [
                        Colors.blue.shade800,
                        Colors.blue.shade200,
                      ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Feels like ${currentWeatherData.current.feelsLike}'),
                  Text('UV Index ${currentWeatherData.current.uvi}'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
