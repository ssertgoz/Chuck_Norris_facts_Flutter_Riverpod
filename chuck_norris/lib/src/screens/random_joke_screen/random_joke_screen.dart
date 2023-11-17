import 'package:flutter/material.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Random Joke"),
        ),
      ),
    );
  }
}
