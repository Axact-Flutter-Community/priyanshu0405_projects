import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

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

class MyHomePage extends StatelessWidget {
  Expanded buildKey({Color color, int num}) {
    return Expanded(
      child: FlatButton(
        color: color,
        child: Icon(Icons.music_note),
        onPressed: () {
          final player = AudioCache();
          player.play('note$num.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Xylophone',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(color: Colors.red, num: 1),
          buildKey(color: Colors.blue, num: 2),
          buildKey(color: Colors.green, num: 3),
          buildKey(color: Colors.yellow, num: 4),
          buildKey(color: Colors.purple, num: 5),
          buildKey(color: Colors.pinkAccent, num: 6),
          buildKey(color: Colors.orange, num: 7),
        ],
      ),
    );
  }
}
