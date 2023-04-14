// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['name'] as String,
      MainWeather.fromJson(json['main'] as Map<String, dynamic>),
      SysWeather.fromJson(json['sys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.cityName,
      'main': instance.mainWeather,
      'sys': instance.sysWeather,
    };

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) => MainWeather(
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      json['humidity'] as int,
    );

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'humidity': instance.humidity,
    };

SysWeather _$SysWeatherFromJson(Map<String, dynamic> json) => SysWeather(
      json['country'] as String,
    );

Map<String, dynamic> _$SysWeatherToJson(SysWeather instance) =>
    <String, dynamic>{
      'country': instance.country,
    };
