import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_tracker/Views/HomePage.dart';

void main() {
  runApp(App());
}

//Main App Widget
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.deepPurple[600], //or set color with: Color(0xFF0000FF)
    ));


    return MaterialApp(
      title: "My Pocket",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor: Colors.deepPurple[500],
        primaryColor: Colors.deepPurple[600],

      ),
      home: HomePage(),
    );

  }
}

