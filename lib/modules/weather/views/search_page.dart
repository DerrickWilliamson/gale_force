import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              const SizedBox(height: 215.0),
              TextField(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
                controller: _textFieldController,
                decoration: InputDecoration(
                  suffixIconColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Enter a city',
                  hintStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.white),
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
      ),
    );
  }
}
