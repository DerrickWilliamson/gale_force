import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: 'coord')
  Coordinates? coordinates;

  @JsonKey(name: 'weather')
  List<WeatherDescription>? weatherDescription;

  @JsonKey(name: 'main')
  MainWeather? mainWeather;

  int? visibility;

  @JsonKey(name: 'wind')
  Wind? wind;

  @JsonKey(name: 'clouds')
  Clouds? clouds;

  @JsonKey(name: 'sys')
  SysWeather? sysWeather;

  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeather(
    this.coordinates,
    this.weatherDescription,
    this.mainWeather,
    this.wind,
    this.clouds,
    this.sysWeather,
    this.visibility,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}

// Coordinates
@JsonSerializable()
class Coordinates {
  double lon;
  double lat;

  Coordinates(this.lon, this.lat);

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

// the 'Weather' object of the JSON response
@JsonSerializable()
class WeatherDescription {
  int id;
  String main;
  String description;
  String icon;

  WeatherDescription(this.id, this.main, this.description, this.icon);

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
}

// Main
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
  int pressure;
  int humidity;

  MainWeather(this.temperature, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity);

  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);
}

// Wind
@JsonSerializable()
class Wind {
  double speed;
  @JsonKey(name: 'deg')
  int degree;
  @JsonKey(name: 'gust')
  double windGust;

  Wind(this.speed, this.degree, this.windGust);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

// Clouds
@JsonSerializable()
class Clouds {
  int all;

  Clouds(this.all);

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

// Sys
@JsonSerializable()
class SysWeather {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  SysWeather(this.type, this.id, this.country, this.sunrise, this.sunset);

  factory SysWeather.fromJson(Map<String, dynamic> json) =>
      _$SysWeatherFromJson(json);
}
