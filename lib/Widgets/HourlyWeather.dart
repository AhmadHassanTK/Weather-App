// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/HourlyWeatherData.dart';

class HourlyWeather extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;
  HourlyWeather({super.key, required this.hourlyWeatherData});

  RxInt cardIndex = GlobalController().getCurrentIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Text(
            'Today',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          height: 150,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeatherData.hourly.length > 24
                ? 24
                : hourlyWeatherData.hourly.length,
            itemBuilder: (context, index) {
              return Obx((() => GestureDetector(
                    onTap: () {
                      cardIndex.value = index;
                    },
                    child: Container(
                      width: 90,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0.5, 0),
                            blurRadius: 30,
                            spreadRadius: 1,
                          ),
                        ],
                        gradient: cardIndex.value == index
                            ? LinearGradient(colors: [
                                Colors.blue.shade800,
                                Colors.blue.shade200,
                              ])
                            : null,
                      ),
                      child: HourlyDetails(
                        index: index,
                        cardindex: cardIndex.toInt(),
                        temp: hourlyWeatherData.hourly[index].temp!,
                        timeStamp: hourlyWeatherData.hourly[index].dt!,
                        weathericon:
                            hourlyWeatherData.hourly[index].weather![0].icon!,
                      ),
                    ),
                  )));
            },
          ),
        )
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  HourlyDetails({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weathericon,
    required this.index,
    required this.cardindex,
  });
  double temp;
  String weathericon;
  int timeStamp;
  int index;
  int cardindex;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
              color: cardindex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$weathericon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            '${temp.round()}°',
            style: TextStyle(
              color: cardindex == index ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
