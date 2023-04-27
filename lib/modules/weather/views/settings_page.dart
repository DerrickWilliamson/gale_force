import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
