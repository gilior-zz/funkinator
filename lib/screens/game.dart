import 'package:flutter/material.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    GameState createState() => new GameState();
  }
}

class GameState extends State<Game> {
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

