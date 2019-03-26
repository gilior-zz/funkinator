import 'package:flutter/material.dart';
import 'package:funkinator/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: LoginScreen(),
      title: 'funkinator',
      theme: ThemeData.light(),
    );
  }

}


