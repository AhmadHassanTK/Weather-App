import 'package:weather_app/model/weather/current.dart';

class CurrentWeatherData {
  final Current current;
  CurrentWeatherData({required this.current});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(current: Current.fromJson(json['current']));
}
