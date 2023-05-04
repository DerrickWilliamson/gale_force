import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/views/weather_screen.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cityController = TextEditingController();

  String userInputtedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              const SizedBox(height: 215.0),
              BlocProvider(
                create: (context) => WeatherBloc(),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    return TextField(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                      controller: _cityController,
                      decoration: InputDecoration(
                        suffixIconColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: 'Enter a city',
                        hintStyle: const TextStyle(
                            fontSize: 25.0, color: Colors.white),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search, size: 35.0),
                          onPressed: () {
                            setState(() {
                              final String city = _cityController.text;
                              Provider.of<WeatherBloc>(context, listen: false)
                                  .add(
                                FetchWeather(city: city),
                              );
                              print('onPressed called');
                              //! should first check for WeatherLoaded state and then navigate to WeatherScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WeatherScreen(),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
