import 'package:weather_app/model/CurrentWeather.dart';
import 'package:weather_app/model/DailyWeather.dart';
import 'package:weather_app/model/HourlyWeatherData.dart';

class WeatherData {
  final CurrentWeatherData? currentWeatherData;
  final HourlyWeatherData? hourlyWeather;
  final DailyWeatherData? dailyWeatherData;

  WeatherData(
      [this.currentWeatherData, this.hourlyWeather, this.dailyWeatherData]);

  CurrentWeatherData getCurrentWeather() => currentWeatherData!;
  HourlyWeatherData getHourlyWeather() => hourlyWeather!;
  DailyWeatherData getDailyWeather() => dailyWeatherData!;
}
