import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "../functions/autocomplete_search.dart";


class MyPassword extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Text('Forget Password?')),
    );
  }
}