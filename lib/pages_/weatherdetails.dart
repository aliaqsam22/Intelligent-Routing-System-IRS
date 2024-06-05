import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model for Weather Data
class Weather {
  final String day;
  final String description;
  final double temperature;

  Weather({
    required this.day,
    required this.description,
    required this.temperature,
  });
}

// Main Weather Screen
class WeatherScreen extends StatefulWidget {
  final double lat;
  final double lon;

  WeatherScreen({required this.lat, required this.lon});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Current weather data
  String cityName = '';
  String description = '';
  double temperature = 0.0;
  double feelsLike = 0.0;
  int humidity = 0;
  double windSpeed = 0.0;

  // Future weather forecast data
  List<Weather> futureWeather = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey = '0308319ab03cfb9a2f5ca634bf2b1e20';
    final url =
        'http://api.openweathermap.org/data/2.5/forecast?lat=${widget.lat}&lon=${widget.lon}&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final city = data['city']['name'];
      final list = data['list'];

      setState(() {
        cityName = city;
        description = list[0]['weather'][0]['description'];
        temperature = list[0]['main']['temp'];
        feelsLike = list[0]['main']['feels_like'];
        humidity = list[0]['main']['humidity'];
        windSpeed = list[0]['wind']['speed'];

        futureWeather = [];
        for (var i = 0; i < list.length; i += 8) {
          final day = list[i]['dt_txt'];
          final description = list[i]['weather'][0]['description'];
          final temperature = list[i]['main']['temp'];
          futureWeather.add(Weather(
              day: day.split(' ')[0],
              description: description,
              temperature: temperature));
        }
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Feels like: ${feelsLike.toStringAsFixed(1)}°C',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            Text(
              'Humidity: $humidity%',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            Text(
              'Wind Speed: ${windSpeed.toStringAsFixed(1)} m/s',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '5-Day Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: futureWeather.length,
                itemBuilder: (context, index) {
                  final weather = futureWeather[index];
                  return Card(
                    color: Colors.blueAccent.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        _getWeatherIcon(weather.description),
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text(
                        weather.day,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        weather.description,
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: Text(
                        '${weather.temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
        return Icons.wb_sunny;
      case 'few clouds':
        return Icons.cloud;
      case 'scattered clouds':
        return Icons.cloud_queue;
      case 'broken clouds':
        return Icons.cloud_off;
      case 'shower rain':
        return Icons.grain;
      case 'rain':
        return Icons.beach_access;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'snow':
        return Icons.ac_unit;
      case 'mist':
        return Icons.blur_on;
      default:
        return Icons.wb_cloudy;
    }
  }
}
