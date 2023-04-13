// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
