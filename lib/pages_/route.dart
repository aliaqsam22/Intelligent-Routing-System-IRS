import 'dart:ffi';
import '../functions/getlatlng.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../functions/calculate_route.dart';

class MyRoute extends StatefulWidget {
  MyRoute({super.key});
  @override
  State<MyRoute> createState() => RouteState();
}

class RouteState extends State<MyRoute> {
  late double sourcelat=0.0,sourcelon,destlat,destlon;
   List<LatLng> routePoints = [LatLng(0.0, 0.0),LatLng(19.0, 19.0)];
  List<Marker> markers = List.empty(growable: true);
  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }
  void updateroute(List<LatLng> newroute) {
    setState(() {
      routePoints = newroute;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final islamabad = new LatLng(33.6844, 73.0479);
    return Scaffold(
      body: Stack(children: [
        Expanded(
          child: FlutterMap(
            options:MapOptions(center: islamabad, zoom: 13.0),
            children:[

              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: markers,
              ),
              PolylineLayer(polylines: [
                  Polyline(
                  points: routePoints,
            color: Colors.blue,
          ),
          ],)
            ],
          ),
        ),
        Row(children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: TextFormField(
                  decoration: InputDecoration(

                      hintText: 'Source',
                      fillColor: Colors.white70,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color(0xffDADADA),
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color(0xffDADADA),
                          )),
                      focusColor: const Color(0xffDADADA)),

                  onFieldSubmitted: (value) async {
                    try {
                      final locationName = value.toString();
                      final coordinates = await getLatLon(locationName);
                      sourcelat=coordinates['lat']!;
                      sourcelon=coordinates['lon']!;
                      print(sourcelat);
                    } catch (e) {
                      print('Error: $e');
                    }
                  }
              )
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child:  TextFormField(
    decoration: InputDecoration(

    hintText: 'Destination',
    fillColor: Colors.white70,
    filled: true,
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(
    color: Colors.black54,
    )),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(
    color: Color(0xffDADADA),
    )),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(
    color: Color(0xffDADADA),
    )),
    focusColor: const Color(0xffDADADA)),

    onFieldSubmitted: (value) async {
      try {
        final locationName = value.toString();
        final coordinates = await getLatLon(locationName);
        destlat=coordinates['lat']!;
        destlon=coordinates['lon']!;
        print(destlat);
      } catch (e) {
        print('Error: $e');
      }
      try {
        final sourceLat = sourcelat;
        final sourceLon = sourcelon;
        final destLat = destlat;
        final destLon = destlon;
        final routePoint = await getRoutePoints(sourceLat, sourceLon, destLat, destLon);
        for (var point in routePoint) {
          routePoints.add(point);
        }
      } catch (e) {
        print('Error: $e');
      }
      updateroute(routePoints);
      print(routePoints);
    }
    )),
        ])
      ]),
    );
  }
}
