part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  String city;

  FetchWeather({required this.city});

  @override
  List<Object> get props => [city];
}
