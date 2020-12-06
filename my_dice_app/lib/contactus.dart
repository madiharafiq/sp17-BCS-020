import 'dart:io';

import 'navigationbar.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyContact());

class MyContact extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: navigationbar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'My name is Arslan Ashraf',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white),
          ),
          SizedBox(height: 30.0),
          Text(
            "Registration No : SP17-BCS-006",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RaisedButton(
              child: Text('Go to Home'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homepage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RaisedButton(
              child: Text('Exit Game'),
              onPressed: () {
                exit(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
