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
// Is the mediator between the presentation layer and the data layer.  Receives an
// an asynchronous stream of events from UI and queries the data layer as needed.  
// Emits new states back to the UI via an asynchronous stream of states.
// on<?> "handlers" and "Emitters"...


//? How a bloc works?
//
//  ...


//? How to create a _bloc.dart file:
//
// ...