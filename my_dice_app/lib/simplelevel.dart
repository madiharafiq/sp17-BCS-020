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
    'dice1.png',
    'dice2.png',
    'dice3.png',
    'dice4.png',
    'dice5.png',
    'dice6.png'
  ];
//var random = new Random();
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Simple Level',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
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
                height: 80.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceOne],
                    height: 150,
                    width: 150,
                  ),
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceTwo],
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 60),
              //   child: Text(
              //     'Sum of Dice = ' +
              //         (randomIntForDiceOne + randomIntForDiceTwo + 2)
              //             .toString(),
              //     style: TextStyle(
              //       fontSize: 40,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.yellowAccent,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 150,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text('Winner Dice'),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: changeImage,
                  child: Text('Roll Dice'),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   //child: RaisedButton(onPressed: MainMenu,
              //     child: Text('Exit Game'),
              //   ),
              // ),
              //
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
                  child: Text('Exit Game'),
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
