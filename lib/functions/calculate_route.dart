import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

Future<List<LatLng>> getRoutePoints(double sourceLat, double sourceLon, double destLat, double destLon) async {
  final apiKey = 'YOUR_TOMTOM_API_KEY';
  final url = 'https://api.tomtom.com/routing/1/calculateRoute/$sourceLat,$sourceLon:$destLat,$destLon/json?key=$apiKey';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<LatLng> routePoints = [];
    for (var leg in data['routes'][0]['legs']) {
      for (var point in leg['points']) {
        final double lat = point['latitude'];
        final double lon = point['longitude'];
        routePoints.add(LatLng(lat, lon));
      }
    }
    return routePoints;
  } else {
    throw Exception('Failed to load route points');
  }
}