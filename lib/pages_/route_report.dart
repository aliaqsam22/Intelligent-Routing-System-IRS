import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class RouteReportScreen extends StatefulWidget {
  final List<LatLng> routePoints;
  final double distance;
  final double travelTime;

  RouteReportScreen({
    required this.routePoints,
    required this.distance,
    required this.travelTime,
  });

  @override
  _RouteReportScreenState createState() => _RouteReportScreenState();
}

class _RouteReportScreenState extends State<RouteReportScreen> {
  List<Weather> weatherReport = [];
  String recommendedTravelTime = '';

  @override
  void initState() {
    super.initState();
    fetchRouteWeather();
  }

  Future<void> fetchRouteWeather() async {
    List<LatLng> selectedPoints = selectKeyPoints(widget.routePoints, 5);

    for (var point in selectedPoints) {
      final weatherData =
          await fetchWeatherData(point.latitude, point.longitude);
      setState(() {
        weatherReport.add(weatherData);
      });
    }

    analyzeWeatherData();
  }

  List<LatLng> selectKeyPoints(List<LatLng> routePoints, int numPoints) {
    List<LatLng> points = [];
    int totalPoints = routePoints.length;
    int interval = (totalPoints / (numPoints - 1)).round();

    for (int i = 0; i < totalPoints; i += interval) {
      points.add(routePoints[i]);
    }

    // Ensure the last point is always included
    if (points.last != routePoints.last) {
      points.add(routePoints.last);
    }

    return points;
  }

  Future<Weather> fetchWeatherData(double lat, double lon) async {
    final apiKey = '0308319ab03cfb9a2f5ca634bf2b1e20';
    final url =
        'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final city = data['city']['name'];
      final List weatherList = data['list'];

      // Calculate the interval based on the travel time
      int travelTimeInterval =
          (widget.travelTime / 3600).round(); // Convert travel time to hours
      int interval = travelTimeInterval ~/ 3; // Divide by 3-hour intervals

      // Ensure the interval does not exceed the length of the weather list
      interval = interval.clamp(1, (weatherList.length - 1) ~/ 3);

      // Extract weather data for now, +interval*3 hours, and +2*interval*3 hours
      final now = weatherList[0];
      final intervalHoursLater = weatherList[interval * 3];
      final doubleIntervalHoursLater = weatherList[interval * 6];

      return Weather(
        city: city,
        conditions: [
          WeatherCondition(
            description: now['weather'][0]['description'],
            icon: now['weather'][0]['icon'],
            temperature: now['main']['temp'],
            windSpeed: now['wind']['speed'],
            humidity: now['main']['humidity'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(
              now['dt'] * 1000,
              isUtc: true,
            ).toLocal().toString(),
            rain: now['rain'] != null ? now['rain']['3h'] ?? 0.0 : 0.0,
          ),
          WeatherCondition(
            description: intervalHoursLater['weather'][0]['description'],
            icon: intervalHoursLater['weather'][0]['icon'],
            temperature: intervalHoursLater['main']['temp'],
            windSpeed: intervalHoursLater['wind']['speed'],
            humidity: intervalHoursLater['main']['humidity'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(
              intervalHoursLater['dt'] * 1000,
              isUtc: true,
            ).toLocal().toString(),
            rain: intervalHoursLater['rain'] != null
                ? intervalHoursLater['rain']['3h'] ?? 0.0
                : 0.0,
          ),
          WeatherCondition(
            description: doubleIntervalHoursLater['weather'][0]['description'],
            icon: doubleIntervalHoursLater['weather'][0]['icon'],
            temperature: doubleIntervalHoursLater['main']['temp'],
            windSpeed: doubleIntervalHoursLater['wind']['speed'],
            humidity: doubleIntervalHoursLater['main']['humidity'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(
              doubleIntervalHoursLater['dt'] * 1000,
              isUtc: true,
            ).toLocal().toString(),
            rain: doubleIntervalHoursLater['rain'] != null
                ? doubleIntervalHoursLater['rain']['3h'] ?? 0.0
                : 0.0,
          ),
        ],
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void analyzeWeatherData() {
    // Analyze the weather data and recommend the best travel time
    // We'll pick the time with the least rain as the best time
    double minRain = double.infinity;
    String bestTime = '';

    for (var weather in weatherReport) {
      for (var condition in weather.conditions) {
        if (condition.rain < minRain) {
          minRain = condition.rain;
          bestTime = condition.dateTime;
        }
      }
    }

    recommendedTravelTime = bestTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Weather Report'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Route Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Distance: ${(widget.distance / 1000).toStringAsFixed(2)} km', // Convert meters to kilometers
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Travel Time: ${(widget.travelTime / 3600).toStringAsFixed(2)} hours', // Convert seconds to hours
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 16.0),
            Text(
              'Weather Conditions Along the Route',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: weatherReport.length,
                itemBuilder: (context, index) {
                  final weather = weatherReport[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City: ${weather.city}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          ...weather.conditions.map((condition) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'http://openweathermap.org/img/wn/${condition.icon}@2x.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Time: ${condition.dateTime}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            'Description: ${condition.description}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Temperature: ${condition.temperature}°C',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Wind Speed: ${condition.windSpeed} m/s',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Humidity: ${condition.humidity}%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Rain: ${condition.rain} mm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recommended Travel Time',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              recommendedTravelTime,
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class Weather {
  final String city;
  final List<WeatherCondition> conditions;

  Weather({
    required this.city,
    required this.conditions,
  });
}

class WeatherCondition {
  final String description;
  final String icon;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final String dateTime;
  final double rain;

  WeatherCondition({
    required this.description,
    required this.icon,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.dateTime,
    required this.rain,
  });
}
