import 'package:flutter/material.dart';
import 'package:gale_force/modules/weather/models/weather.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({super.key, required this.currentWeather});

  final Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                '${currentWeather.cityName}, ${currentWeather.sysWeather.country}:',
                style: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Temperature: ${currentWeather.mainWeather.temperature}:',
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Feels Like: ${currentWeather.mainWeather.feelsLike}:',
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Humidty: ${currentWeather.mainWeather.humidity}:',
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
