import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/API/FetchWeather.dart';
import 'package:weather_app/model/WeatherData.dart';

class GlobalController extends GetxController {
  final RxBool _isloading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkloading() => _isloading;
  RxDouble getlattitude() => _lattitude;
  RxDouble getlongitude() => _longitude;
  RxInt currentIndex = 0.obs;
  final weatherdata = WeatherData().obs;

  WeatherData getdata() {
    return weatherdata.value;
  }

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getlocation();
    } else {
      getCurrentIndex();
    }
    super.onInit();
  }

  RxInt getCurrentIndex() {
    return currentIndex;
  }

  getlocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('The service is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      print(value.latitude);
      print(value.longitude);
      return FetchWeather()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherdata.value = value;
        _isloading.value = false;
      });
    });
  }
}
