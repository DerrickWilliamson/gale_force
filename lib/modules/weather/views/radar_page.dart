import 'package:flutter/material.dart';

class RadarPage extends StatelessWidget {
  const RadarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Radar',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
