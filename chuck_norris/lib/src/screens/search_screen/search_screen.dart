import 'package:flutter/material.dart';

class SearchJokeScreen extends StatelessWidget {
  const SearchJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Search Joke"),
        ),
      ),
    );
  }
}
