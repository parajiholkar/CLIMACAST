import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/API/FetchWeather.dart';

import '../Model/wather/wather.dart';
import '../Model/weatherData.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  late String city ;
  late Wather mumbaiWather ;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;
  String getCity() => city;

  final weatherData = WeatherData().obs ;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    LocationPermission locationPermission;
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('location Not Enabled')));
      return Future.error('location Not Enabled');
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('Location Permission are denied forever')));
      return Future.error('Location Permission are denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text('Location Permission is denied')));
        return Future.error('Location Permission is denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
          _lattitude.value = value.latitude ;
          _longitude.value = value.longitude;

          List<Placemark> placemarks = await placemarkFromCoordinates(_lattitude.value, _longitude.value);
          Placemark place = placemarks[0];
          city = place.locality!;

          await FetchWeatherAPI().processData('mumbai').then((value) {
            mumbaiWather = value.current!.wather ;
          });

          return FetchWeatherAPI().processData(city).then((value) {
            weatherData.value = value ;
            _isLoading.value = false ;
          });
    });
  }
}
