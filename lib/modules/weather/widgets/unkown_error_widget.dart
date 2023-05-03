import 'package:flutter/material.dart';

class UnknownError extends StatelessWidget {
  const UnknownError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('An unknown error has occured',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
