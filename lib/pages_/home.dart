import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  List<Marker> markers = List.empty(growable: true);
  late String apiKey='6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';

  @override
  void dispose() {

    super.dispose();
  }
  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }
  final tomtomHQ = new LatLng(33.6844, 73.0479);

  final initialMarker =
  Marker(
    width: 20.0,
    height: 20.0,
    point: LatLng(52.376372, 4.908066),
    child: const Icon(
        Icons.location_on,
        size: 60.0,
        color: Colors.red),
  );
  @override
  void initState() {
    super.initState();
    markers;

  }
  getAddresses(value, lat, lon) async {
    markers.clear();
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
      var poi=element['poi'];
      var address=element['address'];
      var marker = Marker(
        point: new LatLng(position['lat'], position['lon']),
        width: 50.0,
        height: 50.0,
        child:
               InkWell(
                  child:Icon(Icons.location_on),
                 onTap: (){
                    showModalBottomSheet<void>(
                   context: context,
                   builder: (BuildContext context) {
                     return  Container(
                       height: 200,
                       width: 500,
                       padding: EdgeInsets.all(10),
                       child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(poi['name'],
                               style:const TextStyle(
                                 fontSize: 20,

                               ),
                             ),
                               Text(address['freeformAddress'],
                                 style:const TextStyle(
                                   fontSize: 20,
                                 ),
                               ),
                               ],
                             )
                             );
                   }
                   );
                   },
                 )
      );
      markers.add(marker);
      markers.add(initialMarker);
      print(poi['name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      body:Stack(children:[
        Expanded(child: FlutterMap(
      options:MapOptions(center: tomtomHQ, zoom: 13.0),
      children:[

        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    )),
        Row(
        children: [Expanded(
        child:TextFormField(
            decoration: InputDecoration(

                hintText: 'Search',
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

            onFieldSubmitted: (value){
              print(value);
              getAddresses(value,tomtomHQ.latitude,tomtomHQ.longitude);
            }
        )
        )],)
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
