import 'package:flutter/material.dart';
import 'package:gale_force/modules/weather/views/radar_page.dart';
import 'package:gale_force/modules/weather/views/search_page.dart';
import 'package:gale_force/modules/weather/views/settings_page.dart';
import 'package:gale_force/modules/weather/views/weather_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SearchPage(),
    const RadarPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Radar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
