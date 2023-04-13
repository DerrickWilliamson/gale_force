import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

class Weather {
  @JsonKey(name: 'name')
  String cityName;
  MainWeather mainWeather;
  SysWeather sysWeather;

  Weather(this.cityName, this.mainWeather, this.sysWeather);
}

@JsonSerializable()
class MainWeather {
  @JsonKey(name: 'temp')
  double temperature;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  int humidity;

  MainWeather(this.temperature, this.feelsLike, this.tempMin, this.tempMax,
      this.humidity);

  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);
}

@JsonSerializable()
class SysWeather {
  String country;

  SysWeather(this.country);

  factory SysWeather.fromJson(Map<String, dynamic> json) =>
      _$SysWeatherFromJson(json);
}
