import 'package:flutter/material.dart';
import 'package:osm_map/pages_/profile.dart';
import 'widgets/drawer.dart';
import 'pages_/route.dart';
import 'pages_/home.dart';
import 'pages_/weathermap.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    MyRoute(),
    WeatherMap(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          iconSize: 30,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_sharp),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.route_sharp),
              icon: Icon(Icons.route_outlined),
              label: 'Route',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.cloud_sharp),
              icon: Icon(Icons.cloud_outlined),
              label: 'WeatherMap',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
