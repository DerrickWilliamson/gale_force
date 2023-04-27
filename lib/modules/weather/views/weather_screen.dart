import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherPage2State createState() => _WeatherPage2State();
}

class _WeatherPage2State extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Weather'),
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherInitial) {
                  context.read<WeatherBloc>().add(FetchWeather());
                  // (or)  Provider.of<WeatherBloc>(context, listen: false).add(FetchWeather());
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  // do something with the weather data to display it.
                  // instead of writing UI here I could return a success widget.
                  // have a function for every state that returns the appropriate widget
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
