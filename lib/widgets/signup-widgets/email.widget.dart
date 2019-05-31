import 'package:flutter/material.dart';

class Form_Widget extends StatelessWidget {
  TextEditingController textEditingController;
  bool autoValidate;
  Function errClearFunc;
  String labelText;

  Function validator;

  TextInputType textInputType;

  String errorText;

  Form_Widget({
    this.textEditingController,
    this.autoValidate,
    this.labelText,
    this.textInputType,
    this.validator,
    this.errorText,
    this.errClearFunc
  }) {
    this.textEditingController.addListener(this.errClearFunc);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return TextFormField(
      keyboardType: this.textInputType,
//      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        errorText: this.errorText,
        helperText: ' ',
        labelText: this.labelText,
//        labelText: DemoLocalizations.of(context).email,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: textEditingController,
      autovalidate: autoValidate,
//      validator: validateEmail,
      validator: this.validator,
    );
  }
}
