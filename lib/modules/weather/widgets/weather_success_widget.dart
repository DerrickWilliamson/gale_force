import 'package:flutter/material.dart';
import 'package:gale_force/modules/weather/models/current_weather.dart';
import 'package:gale_force/modules/weather/views/main_page.dart';

class WeatherSuccessWidget extends StatefulWidget {
  const WeatherSuccessWidget({super.key, required this.currentWeather});

  final CurrentWeather currentWeather;

  @override
  State<WeatherSuccessWidget> createState() => _WeatherSuccessWidgetState();
}

class _WeatherSuccessWidgetState extends State<WeatherSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Text(
                  '${widget.currentWeather.name}, ${widget.currentWeather.sysWeather?.country}:',
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Temperature: ${widget.currentWeather.mainWeather?.temperature}:',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Feels Like: ${widget.currentWeather.mainWeather?.feelsLike}:',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Humidty: ${widget.currentWeather.mainWeather?.humidity}:',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MainPage()));
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  child: const Text(
                    'Search Again',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
