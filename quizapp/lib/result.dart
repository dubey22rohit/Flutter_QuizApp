import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetQuiz;

  Result(this.resultscore, this.resetQuiz);

  String get resultPhrase {
    String resultText = "You did it!";
    if (resultscore < 70) {
      resultText = 'You are a disgrace and a burden to this world';
    } else if (resultscore < 200) {
      resultText = 'Disgrace!!';
    } else if (resultscore < 300) {
      resultText = 'You are a decent person,hmm.';
    } else {
      resultText = "You sir/ma'am are a fucking legend!!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
