part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];

  get weather => null;

  get testWeather => null;
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


//? Purpose of the _state.dart file:
//
// SHOULD BE THE CENTRAL LOCATION FOR ALL POSSIBLE STATES DURING THE LIFE-CYCLE OF THE APP!!!
// Emits a stream of states from the bloc back to the presentation layer / UI.
// Holds the state classes that containtypically encapsulate the data needed by the 
// UI to render views and provide a way to represent the state of the application at 
// any given moment. These state classes can be simple data classes or may contain 
// additional methods or properties depending on the requirements of the application.
//
// Example of state class having properties / methods:
//
// class CounterState {
//   final int count;

//   CounterState(this.count);

//   CounterState increment() {
//     return CounterState(count + 1);
//   }

//   CounterState decrement() {
//     return CounterState(count - 1);
//   }
// }


//? How to create a _state.dart file:
//
//  1.  Use the bloc vs code extension to generate a new bloc and relevant folders and files.
//  2.  Add all possible states as classes that extend the abstract class of the _state.dart file.
//  3.  Add any necessary class properties or methods.