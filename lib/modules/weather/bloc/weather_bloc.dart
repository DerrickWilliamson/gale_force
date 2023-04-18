import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather();
      print(weather);
      // var city = weather.cityName;
      // var country = weather.sysWeather.country;
      // var temp = weather.mainWeather.temperature;
      // var tempMax = weather.mainWeather.tempMax;
      // var tempMin = weather.mainWeather.tempMin;
      // var feelsLike = weather.mainWeather.feelsLike;
      // var humidity = weather.mainWeather.humidity;
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Failed to load weather data'));
      }
    });
  }
}


//? Purpose of the _bloc.dart file:
//
// Is the mediator between the presentation layer and the data layer.  The goal is 
// to provide a "seperation of concerns" in keeping the business logic separate from
// the UI.  


//? How a bloc works?
//
//  Receives an asynchronous stream of events from the UI, maps each event to a state,
//  queries the data layer via interacting with a repository, and emits new states
//  back to the UI.  All events are registered via the on<SomeEvent> API which is 
//  responsible for converting incoming events into zero or more outgoing states and
//  calling the associated functionality for each event.  The on<SomeEvent> API replaced 
//  the mapEventToState method.  


//? How to create a _bloc.dart file:
//
//  1.  Use the bloc vs code extension to generate a new bloc and relevant folders and files.
//  2.  Add on<SomeEvent> handlers for each event that emit a given state and the functionality 
//        to be performed.
//  3.  Use an If/Else Statement to check that the response was successful and to handle any errors.