import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  final questions = const [
    {
      'questionText': 'What\'s your favorite play?',
      'answers': [{'text':'shakespeare' , 'score' : 10},
                  {'text':'Doc Mcstuffins' , 'score' : 8},
                  {'text':'Scooby Doo' , 'score' : 5},
                  {'text':'VVV-VENLO' , 'score' : 3},]
    },
    {
      'questionText': 'Who\'s the greatest F1 driver?',
      'answers': [{'text':'Hamilton' , 'score' : 10},
                  {'text':'SChumi' , 'score' : 8},
                  {'text':'Senna' , 'score' : 5},
                  {'text':'Vettel' , 'score' : 3},]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [{'text':'shakes' , 'score' : 10},
                  {'text':'stuffins' , 'score' : 8},
                  {'text':'rabbit' , 'score' : 5},]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
       _questionIndex = 0;
      _totalScore = 0;
    }); 
  }
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < questions.length) {
      print('WE HAVE MORE');
    }else{
      print('NO MORE');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(_answerQuestion, questions, _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
