import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/repository/weather_repo.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherPage2State createState() => _WeatherPage2State();
}

class _WeatherPage2State extends State<WeatherScreen> {
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
                if (state is WeatherInitial) {
                  //! my issue - wasn't calling the bloc function to fetch the weather.
                  //! can do it by the context.read or Provider.of methods.
                  // context.read<WeatherBloc>().add(FetchWeather());
                  Provider.of<WeatherBloc>(context, listen: false)
                      .add(FetchWeather());
                  return CircularProgressIndicator();
                } else if (state is WeatherLoading) {
                  return CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  print(state.currentWeather);
                  // do something with the weather data to display it.
                  // instead of writing UI here I could return a success widget.
                  // have a function for every state that returns the appropriate widget
                  // or create new file and use Mixins to return the appropriate widget.
                  // basically - write a widget for each state and a function that returns
                  // the appropriate widget based on the state.
                  //
                  // anything below a return statement is unreachable code.
                  // NEED TO LEARN FUNCTIONS AND MIXINS AND ENUMS!!
                  return Text(
                      state.currentWeather.mainWeather.temperature.toString());
                } else if (state is WeatherError) {
                  return Text('An error occurred');
                } else {
                  return Text('Unknown');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
