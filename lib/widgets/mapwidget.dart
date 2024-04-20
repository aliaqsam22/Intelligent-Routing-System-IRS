import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final List<Marker> markers;

  MapView({required this.markers});
  @override
  State<MapView> createState() => _MapViewState();
}
class _MapViewState extends State<MapView>{
  MapController mapController = MapController();


  late String apikey='6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';
  @override
  Widget build(context) {return FlutterMap(
    mapController: mapController,
    options:  MapOptions(
      initialCenter: LatLng(0.0,0.0),
      initialZoom: 4.2,
    ),
    children: [
      TileLayer( urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
          "{z}/{x}/{y}.png?key={apiKey}",
        additionalOptions: {"apiKey": apikey},
      ),
      new MarkerLayer(
        markers: widget.markers,
      ),
      PolylineLayer(
        polylines: [

        ],
      ),

    ],
  );
  }}
