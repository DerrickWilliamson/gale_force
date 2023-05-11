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
      color: const Color.fromRGBO(22, 25, 26, 1),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 215.0),
            TextField(
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              controller: _cityController,
              decoration: const InputDecoration(
                hoverColor: Colors.lightGreen,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                hintText: 'Enter a city',
                hintStyle: TextStyle(fontSize: 25.0, color: Colors.white),
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.lightGreen,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                final String city = _cityController.text;
                context.read<WeatherBloc>().add(FetchWeather(city: city));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                'search',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
