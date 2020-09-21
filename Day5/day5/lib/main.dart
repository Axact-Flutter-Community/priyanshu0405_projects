import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quesbank.dart';

QuizMain quizMain = QuizMain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Quizz(),
        ),
      ),
    );
  }
}

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List<Icon> score = [];

  void check(bool ansGiv) {
    setState(() {
      if (quizMain.isFinished()) {
        Alert(
          context: context,
          title: 'Quiz finished!',
          desc: 'You\'ve completed the quiz.',
        ).show();
        quizMain.reset();
        score = [];
      } else {
        if (ansGiv == quizMain.getAns()) {
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizMain.next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
              child: Text(
            quizMain.getQues(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          )),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              child: Text('True'),
              onPressed: () {
                check(true);
              },
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: RaisedButton(
              child: Text('False'),
              onPressed: () {
                check(false);
              },
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(children: score),
          ),
        ),
      ],
    );
  }
}
