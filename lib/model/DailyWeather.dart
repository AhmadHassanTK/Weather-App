import 'package:weather_app/model/weather/daily.dart';

class DailyWeatherData {
  List<Daily> daily;
  DailyWeatherData({required this.daily});

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) =>
      DailyWeatherData(
          daily: List<Daily>.from(json['daily'].map((e) => Daily.fromJson(e))));
}
