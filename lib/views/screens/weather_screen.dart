import 'package:flutter/material.dart';
import 'package:gale_force/views/components/constants.dart';
import 'package:gale_force/views/screens/radar_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '7-day Forecast',
                style: TextStyle(fontSize: 40.0, color: kAppTextColor),
              ),
            ),
            Container(
              height: 200.0,
              width: 500.0,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                children: List.generate(
                  7,
                  (index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.wb_sunny),
                                  const SizedBox(width: 15.0),
                                  Text(
                                    'Day $index',
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Text(
              'Current Conditions in <city>',
              style: TextStyle(fontSize: 40.0, color: kAppTextColor),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RadarScreen()),
                );
              },
              child: const Text('Go to Radar'),
            ),
          ],
        ),
      ),
    );
  }
}
