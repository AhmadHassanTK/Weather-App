// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Widgets/Comfortlevel.dart';
import 'package:weather_app/Widgets/CurrentWeather.dart';
import 'package:weather_app/Widgets/DailyWeather.dart';
import 'package:weather_app/Widgets/Header.dart';
import 'package:weather_app/Widgets/HourlyWeather.dart';
import 'package:weather_app/controller/global_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkloading().isTrue
              ? Center(child: Image.asset('assets/icons/clouds.png'))
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 20),
                    Header(),
                    CurrentWeather(
                      currentWeatherData:
                          globalController.getdata().getCurrentWeather(),
                    ),
                    SizedBox(height: 20),
                    HourlyWeather(
                        hourlyWeatherData:
                            globalController.getdata().getHourlyWeather()),
                    SizedBox(height: 10),
                    DailyWeather(
                        dailyWeatherdata:
                            globalController.getdata().getDailyWeather()),
                    Container(
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 10),
                    ComfortLevel(
                      currentWeatherData:
                          globalController.getdata().getCurrentWeather(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
