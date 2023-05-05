import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/widgets/weather_success_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cityController = TextEditingController();

  String userInputtedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          //! My issue was checking the states in the wrong order - checking WeatherInitial first
          //! which is the initial state emitted by the bloc so it was perpetually stuck on that state
          if (state is WeatherLoaded) {
            //! also needed to update the WeatherSuccess widget to take in the currentWeather object
            return WeatherSuccess(currentWeather: state.currentWeather);
          } else if (state is WeatherError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            );
          } else if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherInitial) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/weather_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
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
                        suffixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Enter a city',
                        hintStyle:
                            TextStyle(fontSize: 25.0, color: Colors.white),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 12.0, end: 12.0),
                          child: Icon(
                            Icons.search,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        final String city = _cityController.text;
                        context
                            .read<WeatherBloc>()
                            .add(FetchWeather(city: city));
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
