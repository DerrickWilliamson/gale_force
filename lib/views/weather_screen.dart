import 'package:flutter/material.dart';
import 'package:gale_force/views/loading_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) =>
      // Tenary operator to check if _isLoading is true or false
      // If true, return LoadingScreen()
      // If false, return Scaffold()
      _isLoading ? LoadingScreen() : Scaffold();
}
