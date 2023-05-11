import 'package:flutter/material.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('An error occurred loading the weather',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
