import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    //! why is WeatherInitial printing first and then again?  is it because
    //! the bloc is being called first before the search_page is built?
    print('Expected #1:  WeatherInitial state is being emitted');
    on<FetchWeather>((event, emit) async {
      if (state is WeatherInitial) return;
      if (state is WeatherLoading) return;
      print('Expected #2:  fetching weather');
      emit(WeatherLoading());

      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather(userCity: event.city);
      print(weather == null);
      emit(WeatherLoaded(weather!));

      if (state is WeatherError) {
        print('WeatherError state is being emitted');
        emit(WeatherError('Error fetching weather'));
      }
    });
  }
}


//! Should I have bloc methods here to be used within the bloc's on handler
//! based upon the state?  For example, for the state of WeatherInitial should
//! I have a function of type widget that returns WeatherInitial widget from 
//! the widgets folder?