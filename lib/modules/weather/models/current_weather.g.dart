// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      json['coord'] == null
          ? null
          : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['main'] == null
          ? null
          : MainWeather.fromJson(json['main'] as Map<String, dynamic>),
      json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      json['sys'] == null
          ? null
          : SysWeather.fromJson(json['sys'] as Map<String, dynamic>),
      json['visibility'] as int?,
      json['timezone'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['cod'] as int?,
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coordinates,
      'weather': instance.weatherDescription,
      'main': instance.mainWeather,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'sys': instance.sysWeather,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      (json['lon'] as num).toDouble(),
      (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) =>
    WeatherDescription(
      json['id'] as int,
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) => MainWeather(
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      json['pressure'] as int,
      json['humidity'] as int,
    );

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      (json['speed'] as num).toDouble(),
      json['deg'] as int,
      (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degree,
      'gust': instance.windGust,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) => Clouds(
      json['all'] as int,
    );

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

SysWeather _$SysWeatherFromJson(Map<String, dynamic> json) => SysWeather(
      json['type'] as int,
      json['id'] as int,
      json['country'] as String,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$SysWeatherToJson(SysWeather instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
