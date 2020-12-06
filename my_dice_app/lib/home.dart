import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'simplelevel.dart';
import 'navigationbar.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text('Dice App')),
      drawer: Drawer(
        child: navigationbar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.red,
              child: Text('Simple Level'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dicepage()),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Hard Level'),
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => MyHomePage()),
              //   );
              // },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Exit Game'),
              onPressed: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
