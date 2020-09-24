import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBank storyBank = StoryBank();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Destini(),
    );
  }
}

class Destini extends StatefulWidget {
  @override
  _DestiniState createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/index.jpeg'), fit: BoxFit.cover)),
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Center(
                  child: Text(
                    storyBank.getStory(),
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: () {
                    setState(() {
                      storyBank.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBank.getChoice1(),
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBank.butVisible(),
                  child: RaisedButton(
                    color: Colors.indigo,
                    onPressed: () {
                      setState(() {
                        storyBank.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBank.getChoice2(),
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
