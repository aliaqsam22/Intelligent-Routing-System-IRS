import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../functions/weatherdata.dart';
import 'weatherdetails.dart';
import 'round_button.dart';

class WeatherMap extends StatefulWidget {
  WeatherMap({super.key});

  @override
  State<WeatherMap> createState() => WeatherMapState();
}

class WeatherMapState extends State<WeatherMap> {
  var maindata;
  List<Marker> markers = List.empty(growable: true);
  late Map<String, dynamic> weatherdata;
  late String apiKey = '6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';

  @override
  void dispose() {
    super.dispose();
  }

  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }

  final tomtomHQ = LatLng(31.5497, 74.3436);

  final initialMarker = Marker(
    width: 20.0,
    height: 20.0,
    point: LatLng(31.5497, 74.3436),
    child: const Icon(Icons.location_on, size: 60.0, color: Colors.red),
  );

  @override
  void initState() {
    super.initState();
    markers.add(initialMarker);
  }

  getAddresses(value, lat, lon) async {
    markers.clear();
    final Map<String, String> queryParameters = {
      'key': apiKey,
      'limit': '1',
      'lat': '$lat',
      'lon': '$lon'
    };

    var response = await http.get(Uri.https(
        'api.tomtom.com', '/search/2/search/$value.json', queryParameters));
    var jsonData = convert.jsonDecode(response.body);
    print(jsonData);
    var results = jsonData['results'];
    for (var element in results) {
      var position = element['position'];
      var address = element['address'];
      try {
        final weatherData =
            await fetchWeather(position['lat'], position['lon']);
        weatherdata = weatherData;
      } catch (e) {
        print('Error: $e');
      }
      var marker = Marker(
          point: LatLng(position['lat'], position['lon']),
          width: 70.0,
          height: 70.0,
          child: InkWell(
            child: Stack(children: [
              Icon(
                Icons.cloud,
                color: Colors.red,
                size: 70,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherdata['temp'].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text('°', style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              )),
            ]),
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.cyanAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address['freeformAddress'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Temperature: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherdata['temp']}°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Feels like: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherdata['feels_like']}°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Maximum: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherdata['temp_max']}°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Minimum: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherdata['temp_min']}°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Humidity: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherdata['humidity']}%',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeatherScreen(
                                              lat: position['lat'],
                                              lon: position['lon'])));
                                },
                                child: Text('More Weather Details'),
                              ),
                            ]));
                  });
            },
          ));
      markers.add(marker);
      markers.add(initialMarker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      body: Stack(children: [
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
          child: TextFormField(
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
              print(value);
              getAddresses(value, 31.5497, 74.3436);
            },
          ),
        )
      ]),
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
}
