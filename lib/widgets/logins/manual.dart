import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/widgets/TextInput.dart';

class ManualLogin extends StatefulWidget {
  ManualLogin();

  @override
  State<StatefulWidget> createState() {
    return ManualLoginState();
  }
}

class ManualLoginState extends State<ManualLogin> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();

//  ManualLoginState();
  @override void initState() {
    // TODO: implement initState

    super.initState();
    mailController.text='aaaaa@aaa.com';
    pwdController.text='1q2w3e';
  }
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
                    child: TextInput(mailController, textStyle, 'Email',
                        'Please enter some text')),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextInput(pwdController, textStyle, 'Pasword',
                        'Please enter some text')),
                RaisedButton(
                  onPressed: ()async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
//                      Scaffold.of(context).showSnackBar(
//                          SnackBar(content: Text('Processing Data')));
                      final FirebaseUser user =
                          await _auth.signInWithEmailAndPassword(
                        email: mailController.text,
                        password: pwdController.text,
                      );
                      debugPrint(user.email);
                      Navigator.pushNamed(context, '/game');
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
