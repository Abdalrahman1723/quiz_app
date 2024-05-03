import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'answer.dart';

//-----------------------------------------
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function(int s) choseAnswer;

  const Quiz(
      {super.key,
      required this.question,
      required this.questionIndex,
      required this.choseAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: question[questionIndex]['questionText'].toString()),
        ...(question[questionIndex]['answer'] as List<Map<String, Object>>).map(
            (e) => Answer(
                answerFunc: () => choseAnswer(int.parse(e['score'].toString())),
                answerText: e["text"].toString())),
      ],
    );
  }
}
