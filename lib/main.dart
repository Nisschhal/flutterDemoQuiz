import 'package:flutter/material.dart';

import 'package:flutter_tut/quiz.dart';
import 'package:flutter_tut/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  final questions = const [
    {
      "questionText": "what is your name?",
      "answers": [
        {"answerText": 'nischal', "score": 10},
        {"answerText": 'nischal puri', "score": 20},
      ]
    },
    {
      "questionText": "what is your favourite food?",
      "answers": [
        {"answerText": 'momo', "score": 5},
        {"answerText": 'chowmein', "score": 10},
        {"answerText": 'sausage', "score": 15},
      ]
    },
  ];
  int _index = 0;
  int _totalScore = 0;
  void _getQuestionIndex(int score) {
    setState(() {
      _totalScore += score;
      _index++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "A demo Quiz App!",
            textAlign: TextAlign.center,
          ),
        ),
        body: _index < questions.length
            ? Quiz(
                index: _index,
                questions: questions,
                getQuestionIndex: _getQuestionIndex)
            : Result(
                finalScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
