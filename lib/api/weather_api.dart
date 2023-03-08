import 'dart:convert'; /* encodes and decodes JSON - not the same as @JSON Serializable. */
import 'package:gale_force/models/weather_model.dart';
import 'package:http/http.dart' as http; /* makes HTTP requests */

/* This class is used to make HTTP requests to the Weather API */
class WeatherApi {
  String city = 'Oklahoma City';

  /* This method is used to make a GET request to the Weather API and return a Weather object.
  It uses the weather_model */
  Future<Weather> getWeatherData() async {
    final uri = Uri.parse(
        /* converts a string API URI into a URI object that can be used in the .get http request. */
        'http://api.weatherapi.com/v1/forecast.json?key=d6935384eb3e4934b72234721230703&q=$city&days=1&aqi=no&alerts=no');
    final response = await http.get(
        uri); /* makes a GET request to the API and returns a response object. */
    if (response.statusCode == 200) {
      final json = jsonDecode(response
          .body); /* decodes the JSON response body into a Map<String, dynamic> object and assigns it to 'json'. */
      return Weather.fromJson(
          json); /* returns a Weather object from the JSON response body here named 'json'. */
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
