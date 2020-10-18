import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': '1 + 1 =',
      'answers': ['3', '5', '1', '2'],
    },
    {
      'questionText': '3 + 4 =',
      'answers': ['7', '8', '9', '5'],
    },
    {
      'questionText': '2 + 1 =',
      'answers': ['3', '9', '4', '5'],
    },
    {
      'questionText': '7 + 3 =',
      'answers': ['3', '10', '5', '9'],
    },
    {
      'questionText': '1 + 1 =',
      'answers': ['3', '5', '1', '2'],
    }
  ];


  var _questionIndex = 0;

  void _answerQuestion() {

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {

    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(
                questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(child: Text('You did it'),),
      ),
    );
  }
}