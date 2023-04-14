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
      //! since I'm instantiating the weather model and a repo here,
      //! does this replace the need for doing it in the UI as I'm currently
      //! doing in the weather_screen.dart file???
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
