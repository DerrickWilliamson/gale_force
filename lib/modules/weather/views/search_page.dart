import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/widgets/weather_initial_widget.dart';
import 'package:gale_force/modules/weather/widgets/weather_success_widget.dart';
import 'package:gale_force/modules/weather/widgets/weather_error_widget.dart';
import 'package:gale_force/modules/weather/widgets/weather_loading_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherLoaded) {
            return WeatherSuccessWidget(currentWeather: state.currentWeather);
          } else if (state is WeatherError) {
            return const WeatherErrorWidget();
          } else if (state is WeatherLoading) {
            return const WeatherLoadingWidget();
          } else if (state is WeatherInitial) {
            return const WeatherInitialWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
