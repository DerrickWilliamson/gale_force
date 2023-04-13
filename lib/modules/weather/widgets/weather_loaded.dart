import 'package:flutter/material.dart';

class WeatherLoaded extends StatefulWidget {
  const WeatherLoaded({super.key});

  @override
  State<WeatherLoaded> createState() => _WeatherLoadedState();
}

class _WeatherLoadedState extends State<WeatherLoaded> {
  @override
  Widget build(BuildContext context) {
    //! would I move the content from the 'weather_screen.dart' file here
    //! and put a blocbuilder() inside of the body of a scaffold()?
    return const Placeholder();
  }
}
