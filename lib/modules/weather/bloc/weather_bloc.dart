import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/current_weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      if (state is WeatherLoading) return;

      WeatherRepo repo = WeatherRepo();
      CurrentWeather? weather =
          await repo.getCurrentWeather(userCity: event.city);
      print(weather);
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Error fetching weather'));
      }
    });
  }
}
