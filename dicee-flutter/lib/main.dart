import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftnum = 1;
  int rightnum = 1;

  void randomizer() {
    setState(() {
      leftnum = Random().nextInt(6) + 1;
      rightnum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                ),
                onPressed: () {
                  randomizer();
                },
                child: Image.asset('images/dice$leftnum.png')),
          ),
          Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                ),
                onPressed: () {
                  randomizer();
                },
                child: Image.asset('images/dice$rightnum.png')),
          ),
        ],
      ),
    );
  }
}
