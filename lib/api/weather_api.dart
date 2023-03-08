import 'dart:convert';
import 'package:gale_force/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  String city = 'Oklahoma City';

  Future<Weather> getWeatherData() async {
    final uri = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=d6935384eb3e4934b72234721230703&q=$city&days=1&aqi=no&alerts=no');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
