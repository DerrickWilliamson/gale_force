import 'package:flutter/material.dart';
import 'package:gale_force/models/weather_model.dart';
import 'package:gale_force/api/open_weather_api.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherPage2State createState() => _WeatherPage2State();
}

class _WeatherPage2State extends State<WeatherScreen> {
  late WeatherModel _openWeather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    final openWeatherApi = OpenWeatherApi();
    final openWeather = await openWeatherApi.getCurrentWeather();
    setState(() {
      _openWeather = openWeather;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_openWeather.cityName}, ${_openWeather.sysWeather.country}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Current Temperature: ${_openWeather.mainWeather.temp} ºF',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Weather Conditions: ${_openWeather.weatherDescription}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text('Feels Like: ${_openWeather.mainWeather.feelsLike} ºF',
                      style: TextStyle(fontSize: 20.0)),
                  Text(
                    'Today\'s Low: ${_openWeather.mainWeather.tempMin} ºF',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Today\'s High: ${_openWeather.mainWeather.tempMax} ºF',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Humidity: ${_openWeather.mainWeather.humidity}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Wind Speed: ${_openWeather.wind.speed} mph',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Sunrise: ${_openWeather.sysWeather.sunrise}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Sunset: ${_openWeather.sysWeather.sunset}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
    );
  }
}
