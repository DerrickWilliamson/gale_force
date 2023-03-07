import 'package:flutter/material.dart';
import 'package:gale_force/views/components/constants.dart';
import 'package:gale_force/views/screens/location_screen.dart';

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
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '7 Day Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: kAppTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 200.0,
                width: 500.0,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  children: List.generate(
                    7,
                    (index) {
                      return Center(
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Day $index',
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Current Conditions',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 35.0,
                      color: kAppTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LocationScreen()));
              },
              child: const Text(
                'Enter New Location',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
