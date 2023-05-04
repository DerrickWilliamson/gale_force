import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale_force/modules/weather/bloc/weather_bloc.dart';
import 'package:gale_force/modules/weather/views/weather_screen.dart';

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
        child: Container(
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Enter a city',
                    hintStyle: TextStyle(fontSize: 25.0, color: Colors.white),
                    // suffixIcon: IconButton(
                    //   icon: const Icon(Icons.search, size: 35.0),
                    //   onPressed: () {
                    //     print('onPressed called');
                    //     final String city = _cityController.text;
                    //     print(_cityController.text);
                    //     // BlocProvider.of<WeatherBloc>(context)
                    //     //     .add(FetchWeather(city: city));
                    //   },
                    // ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    final String city = _cityController.text;
                    print(_cityController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeatherScreen(),
                      ),
                    );
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
                    'Search',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// buildWhen: (previousState, state) {
//                     return state is WeatherLoaded;
//                   },
//                   // Call navigateToWeatherScreen when the state is updated to WeatherLoaded.
//                   // Note that the `state` argument here is the same instance of the `state` object in the `BlocBuilder` widget.
//                   listener: (context, state) {
//                     if (state is WeatherLoaded) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const WeatherScreen(),
//                         ),
//                       );
//                     }
//                   },