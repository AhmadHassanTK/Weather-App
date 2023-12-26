// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/DailyWeather.dart';

class DailyWeather extends StatelessWidget {
  DailyWeather({super.key, required this.dailyWeatherdata});
  DailyWeatherData dailyWeatherdata;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Next Days',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          datalist(),
        ],
      ),
    );
  }

  Widget datalist() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: dailyWeatherdata.daily.length > 7
            ? 7
            : dailyWeatherdata.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Text(getTime(dailyWeatherdata.daily[index].dt)),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          'assets/weather/${dailyWeatherdata.daily[index].weather![0].icon}.png'),
                    ),
                    SizedBox(
                      height: 30,
                      width: 50,
                      child: Text(
                          '${dailyWeatherdata.daily[index].temp!.max}°/${dailyWeatherdata.daily[index].temp!.min}°'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ],
          );
        },
      ),
    );
  }
}
