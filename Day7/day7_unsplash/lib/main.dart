import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: RandomPic(),
    );
  }
}

class RandomPic extends StatefulWidget {
  @override
  _RandomPicState createState() => _RandomPicState();
}

class _RandomPicState extends State<RandomPic> {
  var url =
      "https://api.unsplash.com/photos/random?client_id=xlbTXZvLXv7u8g4_yLmoH0MMvOMFtT_CrrcAaGsQsmM";
  var img;
  void getImage() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        img = data['urls']['full'];
      });
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (Timer t) {
      getImage();
      print('Hello');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Unsplash images',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: Image(
              height: 300,
              width: 300,
              fit: BoxFit.fill,
              image: NetworkImage(img ??
                  "https://images.unsplash.com/photo-1599687349320-469385c7e429?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE2OTIzN30"),
            ),
          ),
        ),
      ),
    );
  }
}
