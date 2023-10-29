import 'package:flutter/foundation.dart';

import 'clouds.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class weatherDataCurrent{
  final Wather wather ;
  weatherDataCurrent({required this.wather});

  factory weatherDataCurrent.fromJson(Map<String, dynamic> json) => weatherDataCurrent(wather: Wather.fromJson(json));
}

class Wather {
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  Sys? sys;
  String? name;
  int? cod;

  Wather({
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.sys,
    this.name,
    this.cod,
  });

  factory Wather.fromJson(Map<String, dynamic> json) => Wather(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        base: json['base'] as String?,
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: json['visibility'] as int?,
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
        name: json['name'] as String?,
        cod: json['cod'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
        'base': base,
        'main': main?.toJson(),
        'visibility': visibility,
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
        'sys': sys?.toJson(),
        'name': name,
        'cod': cod,
      };
}
