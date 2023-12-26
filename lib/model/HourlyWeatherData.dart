import 'package:weather_app/model/weather/hourly.dart';

class HourlyWeatherData {
  List<Hourly> hourly;
  HourlyWeatherData({required this.hourly});

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherData(
          hourly:
              List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));
}
