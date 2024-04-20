import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../widgets/textfield.dart';
import '../widgets/mapwidget.dart';
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  List<Marker> markers = List.empty(growable: true);
  late String apiKey='6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final tomtomHQ = new LatLng(52.376372, 4.908066);

  final initialMarker =
  new Marker(
    width: 50.0,
    height: 50.0,
    point: LatLng(52.376372, 4.908066),
    child: const Icon(
        Icons.location_on,
        size: 60.0,
        color: Colors.red),
  );
  getAddresses(value, lat, lon) async {
    final Map<String, String> queryParameters = {'key': '$apiKey'};
    queryParameters['lat'] = '$lat';
    queryParameters['lon'] = '$lon';
    var response = await http.get(Uri.https('api.tomtom.com',
        '/search/2/search/$value.json',
        queryParameters));
    var jsonData = convert.jsonDecode(response.body);
    print('$jsonData');
    var results = jsonData['results'];
    for (var element in results) {
      var position = element['position'];
      var marker = new Marker(
        point: new LatLng(position['lat'], position['lon']),
        width: 50.0,
        height: 50.0,
        child:
        const Icon(
            Icons.location_on,
            size: 40.0,
            color: Colors.blue),
      );
      markers.add(marker);
      markers.add(initialMarker);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      body:Stack(children:[
        Expanded(child: MapView(markers: [],)),
        Row(
        children: [Expanded(child: Textfield(context, Colors.white70, 'Search', true))],)
      ]),
      floatingActionButton:  FloatingActionButton(
        onPressed:(){},
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
