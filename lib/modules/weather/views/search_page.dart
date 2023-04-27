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
            const Text(
              'Search for \nLocal Weather',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
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
