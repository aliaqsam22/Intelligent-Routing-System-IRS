import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Marker> markers = [];
  late String apiKey = '6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';
  final tomtomHQ = LatLng(33.6844, 73.0479);
  final initialMarker = Marker(
    width: 20.0,
    height: 20.0,
    point: LatLng(52.376372, 4.908066),
    child: const Icon(Icons.location_on, size: 60.0, color: Colors.red),
  );

  @override
  void initState() {
    super.initState();
    markers.add(initialMarker);
  }

  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }

  Future<void> getAddresses(String value, double lat, double lon) async {
    setState(() {
      markers.clear();
    });

    final Map<String, String> queryParameters = {
      'key': apiKey,
      'limit': '1',
      'lat': '$lat',
      'lon': '$lon'
    };

    try {
      var response = await http.get(Uri.https(
          'api.tomtom.com', '/search/2/search/$value.json', queryParameters));
      if (response.statusCode == 200) {
        var jsonData = convert.jsonDecode(response.body);
        var results = jsonData['results'];
        for (var element in results) {
          var position = element['position'];
          var address = element['address'];
          var marker = Marker(
            point: LatLng(position['lat'], position['lon']),
            width: 60.0,
            height: 60.0,
            child: _buildMarkerIcon(context, element, position, address),
          );
          markers.add(marker);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      markers.add(initialMarker);
      setState(() {});
    }
  }

  Widget _buildMarkerIcon(BuildContext context, element, position, address) {
    return InkWell(
      child: const Icon(Icons.location_on, size: 30.0, color: Colors.red),
      onTap: () => _showAddressDetails(context, element, position, address),
    );
  }

  void _showAddressDetails(BuildContext context, element, position, address) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.cyanAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: _buildAddressDetailsContent(element, position, address),
        );
      },
    );
  }

  Widget _buildAddressDetailsContent(element, position, address) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            element['poi']['name'] ?? 'Unknown place',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            address['freeformAddress'],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            address['country'],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Latitude: ${position['lat']}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'Longitude: ${position['lon']}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(center: tomtomHQ, zoom: 13.0),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: _buildSearchField(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Show my Location',
        backgroundColor: Colors.white70,
        shape: const CircleBorder(),
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 18,
          child: Icon(
            Icons.location_on_rounded,
            color: Colors.black54,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.white70,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffDADADA),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xffDADADA),
          ),
        ),
        focusColor: const Color(0xffDADADA),
      ),
      onFieldSubmitted: (value) {
        getAddresses(value, tomtomHQ.latitude, tomtomHQ.longitude);
      },
    );
  }
}
