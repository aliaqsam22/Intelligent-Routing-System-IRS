import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "../functions/weatherdata.dart";
import "round_button.dart";

class WeatherMap extends StatefulWidget {
  WeatherMap({super.key}) ;

  @override
  State<WeatherMap> createState() => WeatherMapState();

}
class WeatherMapState extends State<WeatherMap>{
  var maindata;
  List<Marker> markers = List.empty(growable: true);
  late Map<String, dynamic> weatherdata;
  late String apiKey='6MTa85TPYqM8o0ACQ8yKTUQABKWUPI0N';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers = newMarkers;
    });
  }
  final tomtomHQ = new LatLng(31.5497, 74.3436);

  final initialMarker =
  Marker(
    width: 20.0,
    height: 20.0,
    point: LatLng(31.5497, 74.3436),
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
      try {
        final weatherData = await fetchWeather(position['lat'], position['lon']); // Lahore's coordinates
        weatherdata= weatherData;

      } catch (e) {
        print('Error: $e');
      }
      var marker = Marker(
          point: new LatLng(position['lat'], position['lon']),
          width: 70.0,
          height: 70.0,
          child:
          InkWell(
            child:Stack(children:
            [
              Icon(Icons.cloud,color: Colors.white70,size: 50,)
              ,Center(child:Row(children:[Text(weatherdata['temp'].toString(),style: TextStyle(color: Colors.black),)
              ,Text('°',style:TextStyle(color: Colors.black))])),]),
            onTap: (){
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return  Container(
                        height: 500,
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
                        Row(children:[Text('Temperature : ',
                          style:const TextStyle(
                            fontSize: 20,
                          ),),Text(weatherdata['temp'].toString(),
                      style:const TextStyle(
                      fontSize: 20,
                    ),)
                          ,Text('°',
                    style:const TextStyle(
                    fontSize: 20,
                    ),)
                          ],
                       ),
                            Row(children:[Text('Feels like : ',
                              style:const TextStyle(
                                fontSize: 20,
                              ),),Text(weatherdata['feels_like'].toString(),
                      style:const TextStyle(
                      fontSize: 20,
                    ),)
                              ,Text('°',
                    style:const TextStyle(
                    fontSize: 20,
                    ),)
                            ],
                            ),
                            Row(children:[Text('Maximum : ',
                              style:const TextStyle(
                                fontSize: 20,
                              ),),Text(weatherdata['temp_max'].toString(),
                              style:const TextStyle(
                                fontSize: 20,
                              ),)
                              ,Text('°',
                                style:const TextStyle(
                                  fontSize: 20,
                                ),)
                            ],
                            ),
                        Row(children:[Text('Minimum : ',
                          style:const TextStyle(
                            fontSize: 20,
                          ),),Text(weatherdata['temp_min'].toString(),
                          style:const TextStyle(
                            fontSize: 20,
                          ),)
                          ,Text('°',
                            style:const TextStyle(
                              fontSize: 20,
                            ),)
                    ]
                        ),
                            Row(children:[Text('Humidity : ',
                              style:const TextStyle(
                                fontSize: 20,
                              ),),Text(weatherdata['humidity'].toString(),
                              style:const TextStyle(
                                fontSize: 20,
                              ),)
                              ,Text('%',
                                style:const TextStyle(
                                  fontSize: 20,
                                ),)
                            ]
                            ),
                          ]
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

            TileLayer(  urlTemplate: "https://api.tomtom.com/map/1/tile/basic/night/"
                "{z}/{x}/{y}.png?key={apiKey}",
              additionalOptions: {"apiKey": apiKey},
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
                      filled: false,
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
                    getAddresses(value,31.5497, 74.3436);
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
