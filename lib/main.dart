import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:osm_map/pages_/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBsHoA9SN7671mKLlbVrx1mqYf6Llb8Rc8",
              appId: "1:951235225402:android:44c7dfcbf298c82f96d203",
              messagingSenderId: "951235225402",
              projectId: "intelligent-vehicle-routing",
              storageBucket: "intelligent-vehicle-routing.appspot.com"),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebasebackgroundhandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyLogin());
  }
}
