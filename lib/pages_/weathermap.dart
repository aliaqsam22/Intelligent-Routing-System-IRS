import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import '../widgets/weatherdetails.dart';
import '../widgets/mapwidget.dart';
import '../widgets/textfield.dart';

class WeatherMap extends StatefulWidget {
  WeatherMap({super.key}) ;

  @override
  State<WeatherMap> createState() => WeatherMapState();

}
class WeatherMapState extends State<WeatherMap>{
  List<Marker> markers = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      body:Stack(children:[Expanded(
        child: MapView(markers: [],)
      ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Textfield(context, Colors.white70, 'Search Location for Weather', true)
        ),
        Positioned(
          bottom: 0, // Aligns the widget to the bottom of the Stack
          left: 0,
          right: 0,
          child: Container(
            // Your widget here
            padding: EdgeInsets.all(16.0),
            child:  ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black54),
            onPressed:(){

              showLocationDetailsPopup(context, '', 40.785091, -73.968285);
            },
            child: const Text('Weather Details'))),
          ),
      ],
      )
    );}
}
