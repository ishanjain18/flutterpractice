import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('I Am Rich'),
          ),
          backgroundColor: Colors.cyanAccent[700],
        ),
        backgroundColor: Colors.cyan[100],
        body: Center(
          child: Image(
            image: AssetImage('Images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
