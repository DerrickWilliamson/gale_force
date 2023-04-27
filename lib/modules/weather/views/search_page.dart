import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // controller for the text field to receive value of user input
  final _textFieldController = TextEditingController();

  String userInputtedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter a city',
                hintStyle: const TextStyle(fontSize: 20.0),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        userInputtedCity = _textFieldController.text;
                        print(userInputtedCity);
                      });
                    },
                    icon: const Icon(Icons.search, size: 35.0)),
              ),
            ),
            const SizedBox(height: 15.0),
            // MaterialButton(
            //   color: Colors.blue,
            //   onPressed: () {
            //     setState(() {
            //       userInputtedCity = _textFieldController.text;
            //       print(userInputtedCity);
            //     });
            //   },
            //   child: const Text(
            //     'Search',
            //     style: TextStyle(color: Colors.white, fontSize: 20.0),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
