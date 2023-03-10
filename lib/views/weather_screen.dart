import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gale_force/api/weather_api.dart';
import 'package:gale_force/models/weather_model.dart';
import 'package:gale_force/views/components/constants.dart';
import 'package:gale_force/views/components/icons.dart';
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

/* class methods to be used in the build method below. */
  Future getWeather() async {
    weather = await weatherApi.getWeatherData();
    setState(() {
      getWeather();
      _isLoading = false;
    });
  }

  void setDay() async {
    List datetime = weather.date.split(
        ' '); // Splits the weather object's datatime string into a list of two strings.
    var hours = datetime[1].split(
        ':'); // Splits the second string in the datatime List to separate the hours and minutes.
    var turnInt =
        hours.parse(hours[0]); // Parses the hours string to an integer.
    if (turnInt >= 19 || turnInt <= 5) {
      // Checks if the hour is between 7pm and 5am and sets the isNight bool to true.
      print(turnInt);
      setState(() {
        isNight = true;
        defaultColor = nightAppBarColor;
      });
    }
    if (turnInt > 5 && turnInt < 19) {
      // Checks if the hour is between 5am and 7pm and sets the isDay bool to true.
      setState(() {
        isNight = false;
        isDay = true;
        defaultColor = dayAppBarColor;
      });
    }
  }

  void day() async {
    // Function to set the day theme and icon according to the returned weather object.
    setState(() {
      defaultColor = dayAppBarColor;
    });
    if (weather.text == 'Sunny') {
      setState(() {
        loadingIcon = sunnyIcon;
      });
    }
    if (weather.text == 'Overcast') {
      setState(() {
        loadingIcon = overcastDayIcon;
      });
    }
    if (weather.text == 'Partly Cloudy') {
      setState(() {
        loadingIcon = partlyCloudyDayIcon;
      });
    }
  }

  void night() async {
    // Function to set the night theme and icon according to the returned weather object.
    setState(() {
      defaultColor = nightAppBarColor;
    });

    if (weather.text == 'Partly Cloud') {
      setState(() {
        loadingIcon = partlyCloudyIconNight;
      });
    }
    if (weather.text == 'Clear') {
      setState(() {
        loadingIcon = clearNightIcon;
      });
    }
  }

  void gethour() {
    // Function to get the hour from the returned weather object datetime string.
    List datetime = weather.date.split(' ');
    var hours = datetime[1].split(':');
    var turnInt = int.parse(hours[0]);
    setState(() {
      hour = turnInt;
    });
  }

  /* Calls the getWeather method along with various timers to check the time and set the app theme accordingly. */
  @override
  void initState() {
    getWeather();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setDay();
    });
    Timer.periodic(Duration(seconds: 3), (timer) {
      isDay ? day() : night();
    });
    Timer.periodic(Duration(seconds: 3), (timer) {
      gethour();
    });
    Future.delayed(Duration(seconds: 2), () async {
      await weatherApi.getWeatherData;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      /* Using a tenary operator to check if _isLoading is true or false.
      Able to use the fat arrow syntax because a tenary operator is a one line statement.*/
      _isLoading ? LoadingScreen() : Scaffold();
}
