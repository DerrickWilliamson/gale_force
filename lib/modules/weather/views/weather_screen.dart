import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/widgets/error_loading_widget.dart';
import 'package:gale_force/modules/weather/widgets/loading_weather_widget.dart';
import 'package:gale_force/modules/weather/widgets/unkown_error_widget.dart';
import 'package:gale_force/modules/weather/widgets/weather_success_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherLoading) {
                  print('in loading state');
                  return LoadingWeather();
                } else if (state is WeatherLoaded) {
                  print('in loaded state');
                  return WeatherSuccess();
                } else if (state is WeatherError) {
                  print('in error state');
                  return ErrorLoading();
                } else {
                  print('in an unknown state');
                  // onPressed immediately goes to this unknown state
                  return UnknownError();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
