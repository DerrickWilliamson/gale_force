import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //! A) API key is good.  I've tried mutliple cities and am getting the JSON response to print in the console
  //! B) Updated bloc to check if the state is not WeatherLoading before emitting WeatherLoading, it seems to be stuck in WeatherInitial
  //! C) Once a city is inputted, my WeatherScreen immediately goes to the UnknownError state / widget
  //!       Using breakpoints, it didn't seem that it even checked the prior if statements for various states.
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      if (state is! WeatherLoading) {
        emit(WeatherLoading());
      }

      WeatherRepo repo = WeatherRepo();
      Weather? weather = await repo.getCurrentWeather(userCity: event.city);

      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Error fetching weather'));
      }
    });
  }
}

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   WeatherBloc() : super(WeatherInitial()) {
//     print('Expected #1:  WeatherInitial state is being emitted');
//     on<FetchWeather>((event, emit) async {
//       if (state is WeatherInitial) return;

//       if (state is WeatherLoading) {
//         print('Expected #2:  fetching weather');
//         emit(WeatherLoading());
//       }

//       WeatherRepo repo = WeatherRepo();
//       Weather? weather = await repo.getCurrentWeather(userCity: event.city);
//       print(weather == null);
//       emit(WeatherLoaded(weather!));

//       if (state is WeatherError) {
//         print('WeatherError state is being emitted');
//         emit(WeatherError('Error fetching weather'));
//       }
//     });
//   }
// }
