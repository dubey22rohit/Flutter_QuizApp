import 'package:flutter/material.dart';
import './answers.dart';
import './question.dart';
class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final Function answerButton;
  final int questionIndex;
  Quiz({@required this.answerButton,@required this.questionIndex,@required this.questions});
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Question(questions[questionIndex]['questionText']),
                  ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
                      .map((answer) {
                    return Answers(() => answerButton(answer['score']), answer['text']);
                  }).toList()
                ],
              );
  }
}