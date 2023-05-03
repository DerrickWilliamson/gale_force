import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      if (state is WeatherLoading) return;
      print('fetching weather');
      emit(WeatherLoading());

      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather(userCity: event.city);
      print(weather == null);
      emit(WeatherLoaded(weather!));

      if (state is WeatherError) {
        emit(WeatherError('Error fetching weather'));
      }
    });
  }
}
