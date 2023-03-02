import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider(
          create: (context) => WeatherBloc(),
          child: Container(
            child: const Center(
              child: Text(
                'Weather Screen',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
