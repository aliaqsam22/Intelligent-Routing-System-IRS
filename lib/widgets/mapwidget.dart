import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class MapView extends StatefulWidget {
   List<Marker> markers;

   MapView({required this.markers});
  @override
  State<MapView> createState() => _MapViewState();
}
class _MapViewState extends State<MapView>{
  final String apiKey = "6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N";

void updateMarkers(List<Marker> newMarkers) {
  setState(() {
    widget.markers=newMarkers;
  });
}

  @override
  void initState() {
    super.initState();
    // Invoke the callback function provided by the parent widget with initial markers

  }
  @override
  Widget build(BuildContext context) {
    final tomtomHQ = new LatLng(33.6844, 73.0479);

    return MaterialApp(
      title: "TomTom Map",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(

            child: Stack(
              children: <Widget>[
                FlutterMap(
                  options:MapOptions(center: tomtomHQ, zoom: 13.0),
                  children:[

                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: widget.markers,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }}
