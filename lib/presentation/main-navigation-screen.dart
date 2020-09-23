import 'package:authdemo/presentation/screens/home/home-screen.dart';
import 'package:authdemo/presentation/screens/weather/weather-screen.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {

  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends State<MainNavigationScreen> {

  int _currentIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    WeatherScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_searching),
                label: "Weather"
            )
          ]),
    );
  }

}
