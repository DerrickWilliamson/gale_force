import 'package:flutter/material.dart';
import 'package:gale_force/modules/weather/views/radar_page.dart';
import 'package:gale_force/modules/weather/views/search_page.dart';
import 'package:gale_force/modules/weather/views/settings_page.dart';

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
        backgroundColor: const Color.fromARGB(255, 29, 26, 18),
        iconSize: 30.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.search, size: 36.0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.map_outlined, size: 36.0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.settings, size: 36.0),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
