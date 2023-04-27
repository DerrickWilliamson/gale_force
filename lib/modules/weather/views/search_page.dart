import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter a city',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blueGrey,
                ),
              ),
              child: const Text('Search',
                  style: TextStyle(
                    fontSize: 25.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
