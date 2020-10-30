import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 14) {
      resultText = 'Try Again';
    } else if (resultScore > 14 && resultScore <= 20) {
      resultText = 'You could do better';
    } else if (resultScore > 20 && resultScore <= 30) {
      resultText = 'I see no God up here other than you';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart Quiz'),textColor: Colors.blue, onPressed: resetQuiz,),
        ],
      ),
    );
  }
}
