import 'package:flutter/material.dart';

class Form_Input_Widget extends StatelessWidget {
  TextEditingController textEditingController = null;
  bool autoValidate = false;
  Function errClearFunc = () {};
  String labelText = null;

  Function validator = () {};

  TextInputType textInputType = TextInputType.text;

  String errorText = null;

  Form_Input_Widget(
      {this.textEditingController,
      this.autoValidate,
      this.labelText,
      this.textInputType,
      this.validator,
      this.errorText,
      this.errClearFunc}) {
      this.textEditingController.addListener(this.errClearFunc);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return TextFormField(
      keyboardType: this.textInputType,
      decoration: InputDecoration(
        errorText: this.errorText,
        helperText: ' ',
        labelText: this.labelText,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: textEditingController,
      autovalidate: autoValidate,
      validator: this.validator,
    );
  }
}
