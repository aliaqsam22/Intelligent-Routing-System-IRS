import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

// Define the RouteInfo class
class RouteInfo {
  final List<LatLng> routePoints;
  final double distance;
  final double travelTime;

  RouteInfo({required this.routePoints, required this.distance, required this.travelTime});
}

// Function to get route information
Future<RouteInfo> getRouteInfo(
    double sourceLat, double sourceLon, double destLat, double destLon) async {
  final apiKey = '6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';
  final url =
      'https://api.tomtom.com/routing/1/calculateRoute/$sourceLat,$sourceLon:$destLat,$destLon/json?key=$apiKey';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<LatLng> routePoints = [];
    double distance = 0.0;
    double travelTime = 0.0;

    try {
      // Extract route points
      for (var point in data['routes'][0]['legs'][0]['points']) {
        final double lat = point['latitude'];
        final double lon = point['longitude'];
        routePoints.add(LatLng(lat, lon));
      }
      // Extract distance and travel time
      distance = data['routes'][0]['summary']['lengthInMeters'].toDouble();
      travelTime = data['routes'][0]['summary']['travelTimeInSeconds'].toDouble();
    } catch (e) {
      print('Error parsing route info: $e');
      throw Exception('Failed to parse route info');
    }

    return RouteInfo(routePoints: routePoints, distance: distance, travelTime: travelTime);
  } else {
    print('Failed to load route info: ${response.statusCode} ${response.body}');
    throw Exception('Failed to load route info');
  }
}