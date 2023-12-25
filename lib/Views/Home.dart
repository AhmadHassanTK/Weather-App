import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Widgets/CurrentWeather.dart';
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
              ? const CircularProgressIndicator()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 20),
                    Header(),
                    CurrentWeather(
                      currentWeatherData:
                          globalController.getdata().getCurrentWeather(),
                    ),
                    HourlyWeather(
                        hourlyWeatherData:
                            globalController.getdata().getHourlyWeather()),
                  ],
                ),
        ),
      ),
    );
  }
}
