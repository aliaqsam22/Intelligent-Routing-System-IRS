import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

Widget Textfield(BuildContext context,Color color, String hint,bool isfilled) {
  List<Marker> markers = List.empty(growable: true);
  late String apiKey='6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';

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
    }
  }

  return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 0),

            child: TextFormField(
                decoration: InputDecoration(

                    hintText: '$hint',
                    fillColor: color,
                    filled: isfilled,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xffDADADA),
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xffDADADA),
                        )),
                    focusColor: const Color(0xffDADADA)),

                onFieldSubmitted: (value){
                  print(value);
                  getAddresses(value,tomtomHQ.latitude,tomtomHQ.longitude);
                }
            )
  );
}


