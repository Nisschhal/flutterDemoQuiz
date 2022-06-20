// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetHandler;

  // ignore: use_key_in_widget_constructors
  const Result({required this.finalScore, required this.resetHandler});

  String get getResultPhrase {
    String resultText = "You did it";
    if (finalScore > 5) {
      resultText = "You were great!! with score of $finalScore";
    } else if (finalScore > 10) {
      resultText =
          "Your are not just great you were awesome with totalScore of $finalScore";
    } else {
      resultText = "Don't worry, try next time harder";
    }
    return resultText;
  }
  // const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          getResultPhrase,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.orange),
            primary: Colors.blue,
          ),
          onPressed: resetHandler,
          child: const Text("Reset Quiz!"),
        ),
      ],
    ));
  }
}
