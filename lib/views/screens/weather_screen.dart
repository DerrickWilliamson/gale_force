import 'package:flutter/material.dart';
import 'package:gale_force/views/components/constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String inputtedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _cityNameController,
                decoration: const InputDecoration(
                  labelText: 'Enter City Name',
                  labelStyle: TextStyle(color: kAppTextColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kAppTextColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kAppTextColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Text('$_cityNameController'),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: SizedBox(
            //     height: 200.0,
            //     width: 500.0,
            //     child: GridView.count(
            //       scrollDirection: Axis.horizontal,
            //       crossAxisCount: 1,
            //       children: List.generate(
            //         7,
            //         (index) {
            //           return Center(
            //             child: Card(
            //               color: Colors.white,
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Text(
            //                         'Day $index',
            //                         style: const TextStyle(fontSize: 20.0),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
