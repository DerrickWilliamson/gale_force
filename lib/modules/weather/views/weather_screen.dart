import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                //! Search screen only checks if state is WeatherLoaded but then routes here
                //! where the UI goes back and checks if the state is WeatherLoading
                if (state is WeatherInitial) {
                  print('in initial state');
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoading) {
                  print('in loading state');
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  print('in loaded state');
                  return Column(
                    children: [
                      Text(
                        'Oklahoma City, ${state.currentWeather.sysWeather.country}:',
                        style: const TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Temperature: ${state.currentWeather.mainWeather.temperature}:',
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Feels Like: ${state.currentWeather.mainWeather.feelsLike}:',
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Humidty: ${state.currentWeather.mainWeather.humidity}:',
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                } else if (state is WeatherError) {
                  return const Text('An error occurred loading the weather');
                } else {
                  return const Text('Unknown error');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
