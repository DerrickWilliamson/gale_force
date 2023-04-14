part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

//! WeatherInitial and WeatherLoading are currently one and the same
//! as I'm hard coding in a city name into the uri.  Should these be
//! treated as the same state here?
class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

//! here I'm creating a property of type 'Weather' called 'currentWeather'
//! this allows me to pass this property into the weather_bloc's handler /
//! emitter to pass it back to the UI via a BlocProvider where I can use
//! it in the UI widgets???
class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.currentWeather);

  final Weather currentWeather;
}

//! this class makes sense to me.  I'm giving the bloc a state class that
//! takes in a String error that is passed into the actual bloc handler
//! (same as 'Emitter'???) as I've done in weather_bloc.dart.
class WeatherError extends WeatherState {
  WeatherError(this.error);

  String error;
}
