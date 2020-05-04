import 'package:flutter/material.dart';
import 'package:quizapp/answers.dart';
import 'package:quizapp/result.dart';
import './question.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who is Geralt of Rivia?',
      'answers': [
        {'text': 'A Drowner', 'score': 0},
        {'text': 'A Striga', 'score': 0},
        {'text': 'Jaskier', 'score': 10},
        {'text': 'A Witcher', 'score': 100}
      ]
    },
    {
      'questionText': 'Which is the best song?',
      'answers': [
        {'text': 'Versace on the Floor', 'score': 50},
        {'text': 'Toss A Coin!', 'score': 100},
        {'text': 'Rinkia Ke Papa', 'score': 0},
        {'text': 'Honey Singh\'s Songs', 'score': 0}
      ]
    },
    {
      'questionText': '1 Sparsh IQ  = ?(Standard unit of IQ)',
      'answers': [
         {'text': '0 IQ', 'score': 50},
        {'text': '1200IQ', 'score': 0},
        {'text': '51 IQ', 'score': 100},
        {'text': 'Its over 9000!!!!', 'score': 0}
        
      ]
    },
    {
      'questionText': 'Who is Hanzo Hashashi?',
      'answers': [
        {'text': 'Youtuber', 'score': 10},
        {'text': 'Twitch Streamer', 'score': 0},
        {'text': 'Quan-Chi', 'score': 50},
        {'text': 'Scorpion!!!!', 'score': 100}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz(){
    setState(() {
       _questionIndex = 0;
    _totalScore = 0;
    });
   
  }
  void _answerButton(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Brutally Honest Results Quiz'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerButton: _answerButton,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
