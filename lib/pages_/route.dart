import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import '../widgets/mapwidget.dart';
import '../widgets/textfield.dart';

class MyRoute extends StatefulWidget {
  MyRoute({super.key});
  @override
  State<MyRoute> createState() => RouteState();
}

class RouteState extends State<MyRoute> {
  List<Marker> markers = List.empty(growable: true);
  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Expanded(
          child: MapView(markers: []),
        ),
        Row(children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Textfield(context, Colors.white70, 'Source', true)),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Textfield(context, Colors.white70, 'Destination', true)),
        ])
      ]),
    );
  }
}
