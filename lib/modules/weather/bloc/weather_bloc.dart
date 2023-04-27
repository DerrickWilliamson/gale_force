import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial('Currently in Initial Status')) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather();
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Error fetching weather'));
      }
    });
  }
}
