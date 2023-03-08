/* Creating the WeatherModel class with all properties to be used within the app */
class WeatherModel {
  final String city;
  final double temp;
  final String text;
  final String state;
  final String date;
  final int humidity;
  final double uvIndex;
  final double wind;
  final List forecast;

/* WeatherModel class constructor */
  WeatherModel({
    this.city = '',
    this.temp = 0.0,
    this.text = '',
    this.state = '',
    this.date = '',
    this.humidity = 0,
    this.uvIndex = 0.0,
    this.wind = 0.0,
    this.forecast = const [],
  });

  /* This is a factory METHOD (not a constructor as constructors have the same name as the class
  and don't have a RETURN type) A factory method creates / converts a WeatherModel object from a JSON object
  received from making an API call or from a hard-coded JSON data file. */
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      uvIndex: json['current']['uv'],
      city: json['location']['name'],
      date: json['location']['localtime'],
      forecast: json['forecast']['forecastday'][0]['hour'],
      humidity: json['current']['humidity'],
      state: json['location']['region'],
      temp: json['current']['temp_c'],
      text: json['current']['condition']['text'],
      wind: json['current']['wind_kph'],
    );
  }
  /* Not creating a toJson() method as we are not converting a WeatherModel object to a JSON object 
  to be sent to a server or database. 
  
  Example:
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    etc...
  } */
}
