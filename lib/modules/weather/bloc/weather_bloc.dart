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
      // since I'm instantiating the weather model and repo here,
      // does this replace the need for doing it in the UI as I'm currently
      // doing in the weather_screen.dart file???
      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather();

      // is creating these variables necessary?
      // thought this is what the json_serializable code generation handled.
      var city = weather.cityName;
      var country = weather.sysWeather.country;
      var temp = weather.mainWeather.temperature;
      var tempMax = weather.mainWeather.tempMax;
      var tempMin = weather.mainWeather.tempMin;
      var feelsLike = weather.mainWeather.feelsLike;
      var humidity = weather.mainWeather.humidity;

      // would this be better as 'response.statuscode == 200' as it is
      // complaining about that the weather response will always be true?
      // and why is that?  is it because I'm not doing any error handeling
      // before this is reaching the bloc???
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Failed to load weather data'));
      }
    });
  }
}
