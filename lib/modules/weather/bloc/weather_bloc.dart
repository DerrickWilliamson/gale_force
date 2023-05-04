import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //! bloc emits the WeatherInitial state by default as it is passed into the super constructor
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
