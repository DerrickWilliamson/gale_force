import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Text(
          'Weather Screen',
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}
