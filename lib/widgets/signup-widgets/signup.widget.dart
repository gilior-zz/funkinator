import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';
class SignUpWidget extends StatelessWidget{
  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: DemoLocalizations.of(context).email,
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
                        labelText: DemoLocalizations.of(context).pwd,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: DemoLocalizations.of(context).pwd_2,
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      controller: pwdController_2,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
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

                                  // If the form is valid, we want to show a Snackbar
                                  final FirebaseUser user =
                                  await _auth.createUserWithEmailAndPassword(
                                    email: mailController.text,
                                    password: pwdController.text,
                                  );
                                  debugPrint(user.displayName);

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
                                      first_name: mailController.text.split('@')[0]
                                  );

                                  Navigator.pushNamed(context, '/');
                                },
                                child: Text(DemoLocalizations.of(context).submit),
                              );
                            })
                      ],
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

}