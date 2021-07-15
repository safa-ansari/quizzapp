import 'package:flutter/material.dart';
import 'package:new_quizapp/module/question.dart';

void main() => runApp(MaterialApp(
      home: quizapp(),
    ));

class quizapp extends StatefulWidget {
  const quizapp({Key? key}) : super(key: key);

  @override
  _quizappState createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Is 34 a prime?", true),
    Question.name("Is 5 a prime?", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 2.0,
      ),
      backgroundColor: Colors.lightBlue[20],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/bulb.webp",
                width: 150,
                height: 150,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(300.8),
                  border: Border.all(
                      color: Colors.brown, style: BorderStyle.solid)),
              height: 100.0,
              width: 200.0,
              child: Center(
                child: Text(
                  questionBank[_currentQuestionIndex].questionText,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => _checkAnswer(true),
                  focusColor: Colors.deepPurple[100],
                  child: Text("TRUE"),
                ),
                FloatingActionButton(
                  onPressed: () => _checkAnswer(false),
                  focusColor: Colors.deepPurple[100],
                  child: Text("FALSE"),
                ),
                FloatingActionButton(
                  onPressed: () => _nextQuestion(),
                  focusColor: Colors.deepPurple[100],
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("Yes Correct");
    } else {
      debugPrint("Incorrect");
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
