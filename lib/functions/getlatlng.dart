import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, double>> getLatLon(String locationName) async {
  final apiKey = '6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';
  final response = await http.get(Uri.parse('https://api.tomtom.com/search/2/geocode/$locationName.json?key=$apiKey'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final double lat = data['results'][0]['position']['lat'];
    final double lon = data['results'][0]['position']['lon'];
    return {'lat': lat, 'lon': lon};
  } else {
    throw Exception('Failed to load location');
  }
}