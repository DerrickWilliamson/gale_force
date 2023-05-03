import 'package:flutter/material.dart';

class WeatherLoaded extends StatelessWidget {
  const WeatherLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Weather Success Widget',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
