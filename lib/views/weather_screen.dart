import 'package:flutter/material.dart';
import 'package:gale_force/views/loading_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) =>
      /* Using a tenary operator to check if _isLoading is true or false.
      Able to use the fat arrow syntax because a tenary operator is a one line statement.*/
      _isLoading ? LoadingScreen() : Scaffold();
}
