import 'dart:io';
import 'package:diceapp/navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'navigationbar.dart';
import 'home.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(simplelevel());
}

class simplelevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red[700],
          appBar: AppBar(
            shadowColor: Colors.pink,
            backgroundColor: Colors.redAccent[700],
            centerTitle: true,
            title: Text(
              'Dice Role',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          body: Dicepage(),
        ),
      ),
    );
  }
}

class Dicepage extends StatefulWidget {
  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  var imageArray = [
    'one.png',
    'two.png',
    'three.png',
    'four.png',
    'five.png',
    'six.png'
  ];
//var random = new Random();
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Simple Level',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        drawer: Drawer(
          child: navigationbar(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(21, 50, 21, 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceOne],
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceTwo],
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),

              SizedBox(
               child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text('Winner Dice', style: TextStyle( fontSize: 20.0),),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
              ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: changeImage,
                  child: Text('Roll Dice'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                  color: Colors.red,
                  child: Text('Exit Game',),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void changeImage() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }

  showAlertDialog(BuildContext context) {
    if (randomIntForDiceOne >= randomIntForDiceTwo) {
      AlertDialog alert = AlertDialog(
        title: Text(
          "Winner Dice :",
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        content: Text(
          "Dice One",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.redAccent),
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    if (randomIntForDiceOne < randomIntForDiceTwo) {
      AlertDialog alert = AlertDialog(
        title: Text(
          "Winner Dice :",
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        content: Text(
          "Dice Two",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.redAccent),
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
