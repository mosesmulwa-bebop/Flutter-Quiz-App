import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
class Quiz extends StatelessWidget {
  final Function _answerQuestion;
  final int _questionIndex;
  final List questions;

  Quiz(this._answerQuestion,this.questions, this._questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Question(questions[_questionIndex]['questionText']),
                  //spread operators -> will return list elments as individual elements each.
                  ...(questions[_questionIndex]['answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score']), answer['text']);
                  }).toList(),
                ],
              );
  }
}