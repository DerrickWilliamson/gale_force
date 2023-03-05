import 'package:flutter/material.dart';
import 'package:gale_force/views/components/constants.dart';
import 'package:gale_force/views/screens/weather_screen.dart';

class RadarScreen extends StatelessWidget {
  const RadarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Radar Screen',
                  style: TextStyle(fontSize: 40.0, color: kAppTextColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WeatherScreen()));
                  },
                  child: const Text(
                    'Go to Weather',
                    style: TextStyle(fontSize: 30.0, color: kAppTextColor),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
