import 'package:weather_app/model/CurrentWeather.dart';
import 'package:weather_app/model/HourlyWeatherData.dart';

class WeatherData {
  final CurrentWeatherData? currentWeatherData;
  final HourlyWeatherData? hourlyWeather;

  WeatherData([this.currentWeatherData, this.hourlyWeather]);

  CurrentWeatherData getCurrentWeather() => currentWeatherData!;
  HourlyWeatherData getHourlyWeather() => hourlyWeather!;
}
