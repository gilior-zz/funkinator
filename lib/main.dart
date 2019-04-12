import 'package:flutter/material.dart';
import 'package:funkinator/screens/game.dart';
import 'package:funkinator/screens/login.dart';
import 'package:funkinator/screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Login_Screen(),
      title: 'funkinator',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget

        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/signUp': (context) => Signup_Screen(),
        '/game': (context) => Game_Screen(),
      },
    );
  }

}


