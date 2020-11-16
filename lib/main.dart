import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text(
            "QUIZ TIME!",
            style: TextStyle(fontFamily: 'Righteous'),
          ),
          backgroundColor: Colors.orange.shade800,
        ),
        body: QuestionScreen(),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Icon> scoreKeeper = [];

  void checkAnswer({bool user, bool real}) {
    if (quizBrain.isFinished()) {
      Alert(
        context: context,
        type: AlertType.info,
        title: 'End of game!',
        desc: 'You\'ve reached the end of the quiz!',
        buttons: [
          DialogButton(
            child: Text(
              "Reset game",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Montserrat'),
            ),
            onPressed: () {
              setState(() {
                scoreKeeper.clear();
                quizBrain.nextQuestion();
                Navigator.pop(context);
              });
            },
            width: 170,
          )
        ],
      ).show();
    } else {
      if (user == real) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green.shade500,
        ));
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red.shade700,
          ),
        );
      }
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(real: quizBrain.getAnswer(), user: true);
                    });
                  },
                  color: Colors.green.shade500,
                  child: Text(
                    "True",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(real: quizBrain.getAnswer(), user: false);
                    });
                  },
                  color: Colors.red.shade700,
                  child: Text(
                    'False',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
