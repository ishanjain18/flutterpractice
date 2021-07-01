import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: xyloplay(),
        ),
      ),
    );
  }
}

class xyloplay extends StatefulWidget {
  @override
  _xyloplayState createState() => _xyloplayState();
}

class _xyloplayState extends State<xyloplay> {
  final player = AudioCache();

  xylo_key(int note, Color color) {
    // creates a container and plays respective note

    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        onPressed: () {
          player.play('note$note.wav');
        },
        child: Container(
          padding: EdgeInsets.all(0),
          width: double.infinity,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        xylo_key(1, Colors.purple),
        xylo_key(2, Colors.indigo),
        xylo_key(3, Colors.blue),
        xylo_key(4, Colors.green),
        xylo_key(5, Colors.yellow),
        xylo_key(6, Colors.orange),
        xylo_key(7, Colors.red),
      ],
    );
  }
}

/*

 */
