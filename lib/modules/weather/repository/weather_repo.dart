import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gale_force/modules/weather/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  late String openWeatherApiKey = dotenv.env['OPENWEATHER_API_KEY']!;
  late String finalUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=Oklahoma City&appid=$openWeatherApiKey&units=imperial';

  Future<Weather> getCurrentWeather() async {
    final url = Uri.parse(finalUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Weather weather = Weather.fromJson(data);

      return weather;
    } else {
      throw Exception('Failed to load current weather data');
    }
  }
}

//? How to work with data using json_serializable?:
//
//  1. Setup model classes using json_annotation and json_serializable
//  2. Run build_runner command to generate code for data serialization (encode and decode)
//  3. Set up repositories using the http package as http

//? Purpose of a repository:
//
//  To be the "data source" for an application.  It functions to fetch, post, C.R.U.D data
//  and to encode / decode the data (i.e. fromJson and toJson).  It also is where the model
//  class objects are instantiated to be accessed by the UI.

//? How to create a repository and fetch JSON data?
//
//  1. Use the Uri.parse() method to parse the passed in uri String into an uri object
//  2. Make the http request via someMethod() and pass in the parsed uri object - often
//     assigned to a new property: 'url'.
//  3. Assign the http's response to a new variable like: 'data' or 'response' or 'results'.
//  4. Decode the http's response (currently a String) into a JSON object of Map<String, dynamic>
//        via the jsonDecode() method that is part of the dart:convert library.
//  5. Serialize/Deserlialize the JSON Map<String, dynamic> into model class instances via the
//     fromJson() method automatically generated by the json_annotation and json_serializable
//     packages when running the build_runner command.