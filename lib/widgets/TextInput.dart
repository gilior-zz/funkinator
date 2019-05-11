import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput(this.ctrl, this.textStyle,this.lablelTxt,this.errTxt);

  final TextStyle textStyle;
  final String lablelTxt;
  final String errTxt;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
        labelText: lablelTxt,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: ctrl,
      validator: (value) {
//        if (value.isEmpty) {
//          return errTxt;
//        }
      },
    );
  }
}
