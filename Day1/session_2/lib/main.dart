import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff264E70),
        title: Center(
          child: Text(
            'Image',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/s2.jpg'),
        ),
      ),
    );
  }
}
