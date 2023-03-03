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
            const Text(
              '7-day Forecast',
              style: TextStyle(fontSize: 40.0, color: kAppTextColor),
            ),
            Row(
                // children: [
                //   ListView.separated(
                //       scrollDirection: Axis.vertical,
                //       shrinkWrap: true,
                //       itemCount: 7,
                //       itemBuilder: (BuildContext context, int index) {
                //         return ListTile(
                //           title: Text('Day $index'),
                //           subtitle: Text('Weather $index'),
                //         );
                //       },
                //       separatorBuilder: (context, index) => const Divider(
                //             color: Colors.white,
                //           )),
                // ],
                ), // could this be a ListView or GridView?
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
        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Text(
        //         'Weather Screen',
        //         style: TextStyle(fontSize: 40.0, color: Colors.white),
        //       ),
        //       const SizedBox(
        //         height: 10.0,
        //       ),
        //       ElevatedButton(
        //         style: ButtonStyle(
        //           backgroundColor: MaterialStateProperty.all(Colors.white),
        //           foregroundColor: MaterialStateProperty.all(Colors.black),
        //         ),
        //         onPressed: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) => const LocationScreen()));
        //         },
        //         child: const Text(
        //           'Go to Location Screen',
        //           style: TextStyle(fontSize: 20.0),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
