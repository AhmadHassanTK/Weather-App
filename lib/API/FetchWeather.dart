import 'dart:convert';

import 'package:weather_app/API/apiKey.dart';
import 'package:weather_app/model/CurrentWeather.dart';
import 'package:weather_app/model/DailyWeather.dart';
import 'package:weather_app/model/HourlyWeatherData.dart';
import 'package:weather_app/model/WeatherData.dart';
import 'package:http/http.dart' as http;

class FetchWeather {
  WeatherData? weatherData;

  String apiUrl(var lat, var lan) {
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lan&appid=$apiKey&units=metric&exclude=minutely';

    return url;
  }

  Future<WeatherData> processData(lat, lan) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lan)));
    Map<String, dynamic> jsonString = jsonDecode(response.body);
    print('the jsondecode is $jsonString');
    weatherData = WeatherData(
      CurrentWeatherData.fromJson(jsonString),
      HourlyWeatherData.fromJson(jsonString),
      DailyWeatherData.fromJson(jsonString),
    );
    return weatherData!;
  }
}
