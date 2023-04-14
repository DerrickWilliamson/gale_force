import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherPage2State createState() => _WeatherPage2State();
}

class _WeatherPage2State extends State<WeatherScreen> {
  //! is instantiating a Weather object here necessary if I'm using bloc?
  //! if not, make sure I understand the logic of how it is handled by the bloc.
  //! see my notes in the weather_bloc
  late Weather _openWeather;
  bool _isLoading = true;

  //! is this necessary if state is managed appropriately in the bloc?
  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

//! again, is this function irrelevant here in the UI if I properly set up
//! my bloc and UI widgets???
  Future<void> _loadWeather() async {
    final openWeatherApi = WeatherRepo();
    final openWeather = await openWeatherApi.getCurrentWeather();
    setState(() {
      _openWeather = openWeather;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! should I replace this ternary operator with a BlocBuilder()? or would
      //! the BlocBuilder() go inside of each of the potential widgets indicated below?
      body: _isLoading
          //! should this be a 'WeatherLoading' widget in a 'widgets' folder?
          ? const Center(child: CircularProgressIndicator())
          //! should this be a 'WeatherLoaded' widget in a 'widgets' folder?
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_openWeather.cityName}, ${_openWeather.sysWeather.country}',
                    style: const TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Current Temperature: ${_openWeather.mainWeather.temperature} ºF',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  Text('Feels Like: ${_openWeather.mainWeather.feelsLike} ºF',
                      style: const TextStyle(fontSize: 20.0)),
                  Text(
                    'Today\'s Low: ${_openWeather.mainWeather.tempMin} ºF',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Today\'s High: ${_openWeather.mainWeather.tempMax} ºF',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Humidity: ${_openWeather.mainWeather.humidity}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
    );
  }
}
