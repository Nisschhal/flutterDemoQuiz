import 'package:flutter/cupertino.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int index;
  final List<Map<String, Object>> questions;
  final Function getQuestionIndex;
  // const Quiz({Key? key}) : super(key: key);
  // ignore: use_key_in_widget_constructors
  const Quiz(
      {required this.index,
      required this.questions,
      required this.getQuestionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[index]['questionText'].toString(),
        ),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              selectHandler: () => getQuestionIndex(answer['score']),
              answerText: answer['answerText'].toString());
        }).toList(),
      ],
      // children: [Text("What now?")],
    );
  }
}
