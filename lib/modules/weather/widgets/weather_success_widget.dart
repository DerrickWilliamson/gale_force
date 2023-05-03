import 'package:flutter/material.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Weather Success Widget',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

                  // return Column(
                  //   children: [
                  //     Text(
                  //       'Oklahoma City, ${state.currentWeather.sysWeather.country}:',
                  //       style: const TextStyle(
                  //           fontSize: 40.0, fontWeight: FontWeight.bold),
                  //     ),
                  //     const SizedBox(height: 20.0),
                  //     Text(
                  //       'Temperature: ${state.currentWeather.mainWeather.temperature}:',
                  //       style: const TextStyle(fontSize: 30.0),
                  //     ),
                  //     const SizedBox(height: 10.0),
                  //     Text(
                  //       'Feels Like: ${state.currentWeather.mainWeather.feelsLike}:',
                  //       style: const TextStyle(fontSize: 30.0),
                  //     ),
                  //     const SizedBox(height: 10.0),
                  //     Text(
                  //       'Humidty: ${state.currentWeather.mainWeather.humidity}:',
                  //       style: const TextStyle(fontSize: 30.0),
                  //     ),
                  //     const SizedBox(height: 10.0),
                  //   ],
                  // );
