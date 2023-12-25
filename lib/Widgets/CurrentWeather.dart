// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/model/CurrentWeather.dart';

class CurrentWeather extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  const CurrentWeather({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirstPart(),
        SizedBox(height: 20),
        SecondPart(),
      ],
    );
  }

  Widget FirstPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${currentWeatherData.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.grey,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '${currentWeatherData.current.temp!.round()}°',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: '${currentWeatherData.current.weather![0].description}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
        ])),
      ],
    );
  }

  Widget SecondPart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Image.asset('assets/icons/humidity.png'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text('${currentWeatherData.current.windSpeed} km/h'),
            // Text('${currentWeatherData.current.clouds} km/h'),
            // Text('${currentWeatherData.current.humidity} km/h'),
            SizedBox(
              height: 20,
              width: 66,
              child: Text(
                '${currentWeatherData.current.windSpeed}km/h',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${currentWeatherData.current.clouds}%',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${currentWeatherData.current.humidity}%',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
