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
// the UI and the data layer.  The bloc is where all logic happens such as if the app 
// is going to fetch or send data and what it will do with the data.


//? How a bloc works?
//
//  Based off of the use of streams and event handlers.  Events from the UI (such as user 
//  clicks or long presses) are sent to the bloc via an asynchronous stream and are added to
//  the stream via a "sink."  The bloc then performs business logic on the event and is 
//  responsible for querying the data layer via the repository.  Upon receiving a response 
//  from the data layer, the bloc can perform any additional business logic on the fetched 
//  data before sending it and an updated state back to the UI via an asynchronous stream.  
//  All events are registered by the on<SomeEvent> function which is responsible for converting 
//  incoming events into zero or more outgoing states and calling the associated functionality 
//  for each event.  The on<SomeEvent> API (function) replaced the mapEventToState method.  
//  Most events will be user generated. 


//? What does the term "business logic" refer to in an app?
//
//  Refers to the processing, manipulation, transformation, and error handling of data that is 
//  specific to the business requirements of the application. It includes the rules, algorithms, 
//  and logic that govern how data is processed, validated, transformed, and prepared for presentation 
//  in the user interface.



//? How to create a _bloc.dart file:
//
//  1.  Use the bloc vs code extension to generate a new bloc and relevant folders and files.
//  2.  Add on<SomeEvent> handlers for each event that emit a given state and the functionality 
//        to be performed.
//  3.  Use an If/Else Statement to check that the response was successful and to handle any errors.


//? Dependency Injection (DI) and how to inject blocs into a UI?
//
//  


//? How to access updated state objects within the UI?
//
//  BlocProvicer, BlocBuilder, BlocListender, BlocConsumer...