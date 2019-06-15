import 'package:flutter/material.dart';
import 'package:funkinator/widgets/create-training/create-training.widget.dart';

class Create_Training_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Create_Training_Widget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.thumb_up),
//        backgroundColor: Colors.pink,
      ),
    );
  }
}
