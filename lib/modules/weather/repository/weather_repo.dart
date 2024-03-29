import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gale_force/modules/weather/models/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  late String openWeatherApiKey = dotenv.env['OPENWEATHER_API_KEY']!;

  Future<CurrentWeather?> getCurrentWeather({required String userCity}) async {
    try {
      String finalUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$userCity&appid=$openWeatherApiKey&units=imperial';
      final url = Uri.parse(finalUrl);
      final response = await http.get(url);

      var data = jsonDecode(response.body);
      CurrentWeather weather = CurrentWeather.fromJson(data);

      return weather;
    } catch (e) {
      print(e);
      return null;
    }
  }
}


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