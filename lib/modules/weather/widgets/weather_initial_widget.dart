import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';

class WeatherInitialWidget extends StatefulWidget {
  const WeatherInitialWidget({super.key});

  @override
  State<WeatherInitialWidget> createState() => _WeatherInitialWidgetState();
}

class _WeatherInitialWidgetState extends State<WeatherInitialWidget> {
  final TextEditingController _cityController = TextEditingController();

  String userInputtedCity = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 150.0),
            const Text(
              'Find Local Weather',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50.0),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Enter a City',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 68, 67, 67),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                final String city = _cityController.text;
                context.read<WeatherBloc>().add(FetchWeather(city: city));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(200.0, 50.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
