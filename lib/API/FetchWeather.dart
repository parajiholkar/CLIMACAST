import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather/API/apiKey.dart';
import 'package:weather/Model/wather/wather.dart';

import '../Controller/globelController.dart';
import '../Model/weatherData.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI{
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  WeatherData? weatherData ;

  Future<WeatherData> processData(String city) async{
    var response = await http.get(Uri.parse(await apiURL(city)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(weatherDataCurrent.fromJson(jsonString));
    return weatherData! ;
  }

  Future<String> apiURL(String City) async{
    String URL ;
    URL = 'https://api.openweathermap.org/data/2.5/weather?q=${City}&APPID=a353722249db863e44a1047cd024c163' ;
    return URL ;
  }
}