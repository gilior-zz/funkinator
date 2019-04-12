import 'dart:async';
import 'package:flutter/material.dart';

class ManualLogin extends StatefulWidget {
  ManualLogin();

  @override
  State<StatefulWidget> createState() {
    return ManualLoginState();
  }
}

class ManualLoginState extends State<ManualLogin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();

  ManualLoginState();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Column(
      children: <Widget>[
        Card(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: mailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Pasword',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: pwdController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: Text(
                    'click here to sign up',
                    style: TextStyle(
                        fontSize: 15.0, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Update the description of Note object

  // Save data to database
  void _save() async {
    moveToLastScreen();
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text('title'),
      content: Text('message'),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
