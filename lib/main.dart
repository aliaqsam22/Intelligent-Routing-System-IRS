import 'package:flutter/material.dart';
import 'pages_/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          indicatorColor: Colors.black,
          primaryColor: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
          ),
          iconTheme: const IconThemeData(size: 30, color: Colors.blue)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
