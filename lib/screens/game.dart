import 'package:flutter/material.dart';

class Game_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    Game_ScreenState createState() => new Game_ScreenState();
  }
}

class Game_ScreenState extends State<Game_Screen> {
  @override void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build   
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text('u made it'),
    );
  }
}

