import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int d1 = 1, d2 = 2, d3 = 3, d4 = 4;

  void dice() {
    setState(() {
      d1 = Random().nextInt(6) + 1;
      d2 = Random().nextInt(6) + 1;
      d3 = Random().nextInt(6) + 1;
      d4 = Random().nextInt(6) + 1;
    });
  }

  int sum;

  @override
  Widget build(BuildContext context) {
    sum = d1 + d2 + d3 + d4;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Dices',
            style: TextStyle(fontSize: 25),
          )),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.redAccent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      dice();
                    },
                    child: Image(
                      image: AssetImage('images/dice$d1.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      dice();
                    },
                    child: Image(
                      image: AssetImage('images/dice$d2.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      dice();
                    },
                    child: Image(
                      image: AssetImage('images/dice$d3.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      dice();
                    },
                    child: Image(
                      image: AssetImage('images/dice$d4.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Total sum is $sum',
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
          ],
        ));
  }
}
