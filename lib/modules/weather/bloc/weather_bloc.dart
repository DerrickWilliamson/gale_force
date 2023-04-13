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
      Weather? currentWeather = await repo.getCurrentWeather();

      if (currentWeather != null) {
        emit(WeatherLoaded());
      } else {
        emit(WeatherError('Failed to load weather data'));
      }
    });
  }
}