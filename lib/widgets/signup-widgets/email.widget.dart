import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import '../../models/const.dart';
class Email_Widget extends StatelessWidget {
  TextEditingController mailController;
  bool autoValidate;

  Email_Widget({this.mailController, this.autoValidate}) {}

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
//                                        errorText: '',
        labelText: DemoLocalizations.of(context).email,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: mailController,
      autovalidate: autoValidate,
      validator: validateEmail,
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
