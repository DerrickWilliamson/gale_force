part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

// currently hard coding in a city name into the uri.
// do I need a 'CityInputted' equivalent class?
class FetchWeather extends WeatherEvent {}



//? Purpose of the _event.dart file:
//
//  SHOULD BE THE CENTRAL LOCATION FOR ALL POSSIBLE EVENTS DURING THE LIFE CYCLE OF THE APP!!!
//  Emits an asynchronous stream of events to the bloc.  Holds event classes or enums that 
//  represent user actions, system events, or any other type of action that can affect the 
//  state of the application.  Typically are simple data objects that encapsulate the necessary 
//  information related to the action or trigger.  

//  Example of event class having properties:
//  
//  abstract class FormEvent {}

//  class SubmitForm extends FormEvent {
//    final String username;
//    final String password;

//    SubmitForm({required this.username, required this.password});
//   }


//? How to create a _event.dart file:
// 
//  1.  Use the bloc vs code extension to generate a new bloc and relevant folders and files.
//  2.  Add all possible events as classes that extend the abstract class of the _event.dart file.
//  3.  Add any necessary class properties or methods.