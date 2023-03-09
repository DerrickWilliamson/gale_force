import 'package:flutter/material.dart';
import 'package:gale_force/api/weather_api.dart';
import 'package:gale_force/models/weather_model.dart';
import 'package:gale_force/views/loading_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  /* Creates an instance of the WeatherApi class to access the getWeatherData() method which calls the API / http request. */
  WeatherApi weatherApi = WeatherApi();

  /* Creates an instance of the Weather class to access the Weather object and fromJson() method. */
  WeatherModel weather = WeatherModel();

/* class properties to be used in the WeatherScreen class methods and build method. */
  String image = '';
  Color defaultColor = Colors.black;
  int hour = 0;
  bool isDay = false;
  bool isNight = false;
  String icon = '';
  bool _isLoading = true;

  Future getWeather() async {
    weather = await weatherApi.getWeatherData();
    setState(() {
      getWeather();
      _isLoading = false;
    });
  }

  void setDay() async {
    List datetime = weather.date.split(' ');
    var hours = datetime[1].split(':');
    var turnInt = hours.parse(hours[0]);
    if (turnInt >= 19 || turnInt <= 5) {
      print(turnInt);
      setState(() {
        isNight = true;
        defaultColor = nightAppBarColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      /* Using a tenary operator to check if _isLoading is true or false.
      Able to use the fat arrow syntax because a tenary operator is a one line statement.*/
      _isLoading ? LoadingScreen() : Scaffold();
}
