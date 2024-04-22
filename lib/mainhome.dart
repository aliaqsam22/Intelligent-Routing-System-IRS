import 'package:flutter/material.dart';
import 'widgets/drawer.dart';
import 'widgets/maptypedropdown.dart';
import 'pages_/route.dart';
import 'pages_/home.dart';
import 'pages_/weathermap.dart';
import 'pages_/signup.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Home(
      title: 'home',
    ),
    MyRoute(),
    WeatherMap(),
  ];
  String selectedoption = 'hello';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: Container(
          padding: const EdgeInsets.only(top: 110),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Map Types', style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            primary: false,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal[100],
                                child: const Text(
                                    "He'd have you all unravel at the"),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal[200],
                                child: const Text('Heed not the rabble'),
                              ),
                            ],
                          ))
                        ]),
                  );
                },
              );
            },
            child: const Icon(
              Icons.layers,
              color: Colors.white,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        iconSize: 30,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            activeIcon: Icon(
              Icons.home_sharp,
            ),
            icon: Icon(Icons.home_outlined, color: Colors.black54),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined, color: Colors.black54),
            activeIcon: Icon(Icons.route_sharp),
            label: 'Route',
            // backgroundColor: Colors.purpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined, color: Colors.black54),
            activeIcon: Icon(Icons.cloud_sharp),
            label: 'WeatherMap',
            //backgroundColor: Colors.purpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.black54),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
            //backgroundColor: Colors.purpleAccent,
          ),
        ],
      ),
    ));
  }
}
