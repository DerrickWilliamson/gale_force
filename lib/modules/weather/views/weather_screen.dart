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
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                  bloc: WeatherBloc(),
                  builder: (context, state) {
                    return Column(
                      children: [
                        // Text(
                        //   'City: ${state.testWeather.cityName}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        Text(
                          'Temperature: ${state.temperature}',
                          style: TextStyle(fontSize: 20),
                        ),
                        // Text(
                        //   'Feels Like: ${state.weather.mainWeather.feelsLike}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // Text(
                        //   'Min Temperature: ${state.weather.mainWeather.tempMin}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // Text(
                        //   'Max Temperature: ${state.weather.mainWeather.tempMax}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // Text(
                        //   'Humidity: ${state.weather.mainWeather.humidity}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // Text(
                        //   'Country: ${state.weather.sysWeather.country}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
