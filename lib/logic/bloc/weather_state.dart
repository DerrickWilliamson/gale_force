part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final CurrentWeather weather;

  WeatherLoaded(this.weather);
}

class WeatherLoadError extends WeatherState {
  final String errorMessage;

  WeatherLoadError(this.errorMessage);
}
