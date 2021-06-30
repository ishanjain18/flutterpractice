import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // make status bar transparent
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff462A4F),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('Images/BuriBuriDance.gif'),
              ),
              Text('Bruhfist',
                  style: GoogleFonts.staatliches(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFcab462),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Text('HEMLO WORLD',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFcab462),
                      letterSpacing: 2.3,
                    ),
                  )),
              SizedBox(
                width: 150.0,
                child: Divider(
                  color: Color(0xFFcab462),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Color(0xFFcab462),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Color(0xff462A4F),
                  ),
                  title: Text(
                    '+123 456 789',
                    style: TextStyle(
                      color: Color(0xFF504620),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Color(0xFFcab462),
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Color(0xff462A4F),
                  ),
                  title: Text(
                    'bruhfist@mail.com',
                    style: TextStyle(
                      color: Color(0xFF504620),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
*
*
*
*
*
* */
