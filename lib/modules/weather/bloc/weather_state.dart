part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.currentWeather);

  final Weather currentWeather;
}

class WeatherError extends WeatherState {
  WeatherError(this.error);

  String error;
}
