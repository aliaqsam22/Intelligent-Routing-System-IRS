import '../functions/getlatlng.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../functions/calculate_route.dart';
import 'round_button.dart';
import 'route_report.dart';

class MyRoute extends StatefulWidget {
  MyRoute({super.key});

  @override
  State<MyRoute> createState() => RouteState();
}

class RouteState extends State<MyRoute> {
  double? sourcelat, sourcelon, destlat, destlon;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];

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
    final islamabad = LatLng(33.6844, 73.0479);
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: FlutterMap(
                options: MapOptions(center: islamabad, zoom: 7.0),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: Colors.blue,
                        strokeWidth: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffDADADA)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffDADADA)),
                ),
                focusColor: const Color(0xffDADADA),
              ),
              onFieldSubmitted: (value) async {
                try {
                  final locationName = value.toString();
                  final coordinates = await getLatLon(locationName);
                  setState(() {
                    sourcelat = coordinates['lat']!;
                    sourcelon = coordinates['lon']!;
                  });
                  print(sourcelat);
                } catch (e) {
                  print('Error: $e');
                }
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Destination',
                fillColor: Colors.white70,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffDADADA)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xffDADADA)),
                ),
                focusColor: const Color(0xffDADADA),
              ),
              onFieldSubmitted: (value) async {
                try {
                  final locationName = value.toString();
                  final coordinates = await getLatLon(locationName);
                  setState(() {
                    destlat = coordinates['lat']!;
                    destlon = coordinates['lon']!;
                  });
                  print(destlat);
                } catch (e) {
                  print('Error: $e');
                }
                if (sourcelat != null &&
                    sourcelon != null &&
                    destlat != null &&
                    destlon != null) {
                  try {
                    RouteInfo routeInfo = await getRouteInfo(
                        sourcelat!, sourcelon!, destlat!, destlon!);
                    updateroute(routeInfo.routePoints);

                    final initialMarker = Marker(
                      width: 20.0,
                      height: 20.0,
                      point: LatLng(sourcelat!, sourcelon!),
                      child: InkWell(
                        child: Icon(Icons.location_on,
                            size: 30.0, color: Colors.red),
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.lightBlueAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Distance: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${routeInfo.distance} km',
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
                                          "Travel Time: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${(routeInfo.travelTime / 3600).toStringAsFixed(2)} hrs',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    RoundBut(
                                      title: 'Weather Report of Route',
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RouteReportScreen(
                                              routePoints:
                                                  routeInfo.routePoints,
                                              distance: routeInfo.distance,
                                              travelTime: routeInfo.travelTime,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );

                    final finalMarker = Marker(
                      width: 20.0,
                      height: 20.0,
                      point: LatLng(destlat!, destlon!),
                      child: InkWell(
                        child: Icon(Icons.location_on,
                            size: 30.0, color: Colors.red),
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.lightBlueAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Distance: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${routeInfo.distance} km',
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
                                          "Travel Time: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${(routeInfo.travelTime / 3600).toStringAsFixed(2)} hrs',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    RoundBut(
                                      title: 'Weather Report of Route',
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RouteReportScreen(
                                              routePoints:
                                                  routeInfo.routePoints,
                                              distance: routeInfo.distance,
                                              travelTime: routeInfo.travelTime,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );

                    markers.clear();
                    markers.add(initialMarker);
                    markers.add(finalMarker);
                    updateMarkers(markers);
                    print("route updated");
                  } catch (e) {
                    print('Error: $e');
                  }
                }
              },
            ),
          ),
        ]),
      ]),
    );
  }
}
