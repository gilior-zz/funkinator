import 'package:flutter/material.dart';

class Email_Widget extends StatelessWidget {
  TextEditingController mailController;
  bool autoValidate;

  String labelText;

  Function validator;

  TextInputType textInputType;

  Email_Widget(
      {this.mailController,
      this.autoValidate,
      this.labelText,
      this.textInputType,
      this.validator}) {}

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return TextFormField(
      keyboardType: this.textInputType,
//      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
//        errorText: 'foo',
        helperText: ' ',
        labelText: this.labelText,
//        labelText: DemoLocalizations.of(context).email,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: mailController,
      autovalidate: autoValidate,
//      validator: validateEmail,
      validator: this.validator,
    );
  }

}
