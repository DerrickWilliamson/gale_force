import 'package:flutter/material.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/views/main_page.dart';

class WeatherSuccessWidget extends StatefulWidget {
  const WeatherSuccessWidget({super.key, required this.currentWeather});

  final Weather currentWeather;

  @override
  State<WeatherSuccessWidget> createState() => _WeatherSuccessWidgetState();
}

class _WeatherSuccessWidgetState extends State<WeatherSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_background.png'),
            colorFilter: ColorFilter.linearToSrgbGamma(),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Text(
                  '${widget.currentWeather.cityName}, ${widget.currentWeather.sysWeather.country}:',
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Temperature: ${widget.currentWeather.mainWeather.temperature}:',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Feels Like: ${widget.currentWeather.mainWeather.feelsLike}:',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Humidty: ${widget.currentWeather.mainWeather.humidity}:',
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
