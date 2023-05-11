import 'package:flutter/material.dart';

class WeatherInitialWidget extends StatefulWidget {
  const WeatherInitialWidget({super.key});

  @override
  State<WeatherInitialWidget> createState() => _WeatherInitialWidgetState();
}

class _WeatherInitialWidgetState extends State<WeatherInitialWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
            child: Text(
          'Search for a city to get started!',
          style: TextStyle(fontSize: 30.0),
        )),
      ],
    );
  }
}
