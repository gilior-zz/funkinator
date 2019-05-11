import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/TextInput.dart';
import 'package:scoped_model/scoped_model.dart';

class ManualLoginWidget extends StatefulWidget {
  ManualLoginWidget();

  @override
  State<StatefulWidget> createState() {
    return ManualLoginWidgetState();
  }
}

class ManualLoginWidgetState extends State<ManualLoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();

//  ManualLoginState();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    mailController.text = 'a@a.com';
    pwdController.text = '1q2w3e1q2w3e';
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Column(
      children: <Widget>[
        Card(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextInput(
                          mailController,
                          textStyle,
                          DemoLocalizations.of(context).email,
                          'Please enter some text')),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextInput(
                          pwdController,
                          textStyle,
                          DemoLocalizations.of(context).pwd,
                          'Please enter some text')),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          ScopedModelDescendant<AppModel>(
                              builder: (context, child, appModel) {
                            return RaisedButton(
                              onPressed: () async {
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
                                  var map = Map<String, dynamic>();

                                  map['origin'] = 'manual';
                                  map['email'] = mailController.text;

                                  map['created'] = FieldValue.serverTimestamp();

                                  Firestore.instance
                                      .collection('logins')
                                      .document()
                                      .setData(map);

                                  appModel.updateUser(
                                      email: mailController.text,
                                      first_name:
                                          mailController.text.split('@')[0]);

                                  Navigator.pushNamed(context, '/main');
                                }
                              },
                              child: Text(DemoLocalizations.of(context).submit),
                            );
                          })
                        ],
                      )),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      DemoLocalizations.of(context).click_to_sign,
                      style: TextStyle(
                          fontSize: 15.0, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
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
