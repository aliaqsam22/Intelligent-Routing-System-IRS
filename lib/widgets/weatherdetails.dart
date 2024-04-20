import 'package:flutter/material.dart';

void showLocationDetailsPopup(BuildContext context, String locationName, double latitude, double longitude) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Location Details'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Name: $locationName'),
              Text('Latitude: $latitude'),
              Text('Longitude: $longitude'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
