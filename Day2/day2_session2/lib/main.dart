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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('images/me.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Priyanshu Jain',
                style: TextStyle(
                  color: Color(0xfffaf6c5),
                  fontFamily: 'Quicksand',
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0, top: 10.0),
              child: Text(
                'All-Star Dev | Contributor | Programmer',
                style: TextStyle(
                  color: Color(0xfffaf6c5),
                  fontFamily: 'Quicksand',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Card(
                margin: const EdgeInsets.all(10.0),
                color: Color(0xfffaf6c5),
                child: ListTile(
                  title: Text(
                    '+91-9599242249',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand'),
                  ),
                  leading: Icon(Icons.call),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Card(
                margin: const EdgeInsets.all(10.0),
                color: Color(0xfffaf6c5),
                child: ListTile(
                  title: Text(
                    'priyanshu0405jain@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Quicksand'),
                  ),
                  leading: Icon(Icons.mail),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
