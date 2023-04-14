part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

//! currently hard coding in a city name into the uri.
//! do I need a 'CityInputted' equivalent class?
class FetchWeather extends WeatherEvent {}
