import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
  final apiKey = '0308319ab03cfb9a2f5ca634bf2b1e20';
  final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  final response = await http.get(Uri.parse(url));
  var hell;

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final Map<String, dynamic> main = data['main'];
     hell= {
      'temp': main['temp'],
      'feels_like': main['feels_like'],
      'temp_min': main['temp_min'],
      'temp_max': main['temp_max'],
      'pressure': main['pressure'],
      'humidity': main['humidity'],
    };

  } else {
    throw Exception('Failed to load weather data');

  }
  return hell;
}