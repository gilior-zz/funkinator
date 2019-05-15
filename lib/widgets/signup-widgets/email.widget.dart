import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';

import '../../models/const.dart';

class Email_Widget extends StatelessWidget {
  TextEditingController mailController;
  bool autoValidate;

  String labelText;

  Function validator;

  TextInputType textInputType;

  Email_Widget({this.mailController, this.autoValidate,this.labelText,this.textInputType,this.validator}) {}

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

//  String validateEmail(String value) {
//    Pattern pattern =
//        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//    RegExp regex = new RegExp(pattern);
//    if (!regex.hasMatch(value))
//      return '';
//    else
//      return null;
//  }
}
