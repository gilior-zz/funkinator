import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/TextInput.dart';
import 'package:funkinator/widgets/common-widgets/form-input.widget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/const.dart';
import 'package:flutter/services.dart';

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
  bool _autoValidate = false;

  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();
  String emlErr = null;
  String pwdErr = null;
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
                    child: Form_Input_Widget(
                      validator: validateEmail,
                      textInputType: TextInputType.emailAddress,
                      autoValidate: this._autoValidate,
                      textEditingController: mailController,
                      labelText: DemoLocalizations.of(context).email,
                      errClearFunc: this.clearEmlErr,
                      errorText: this.emlErr,

                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form_Input_Widget(
                      validator: ValidateIsEmpty,
                      textInputType: TextInputType.text,
                      autoValidate: this._autoValidate,
                      textEditingController: pwdController,
                      labelText: DemoLocalizations.of(context).pwd,
                      errClearFunc: this.clearPwdErr,
                      errorText: this.pwdErr,
                    )
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
                                setState(() {
                                  _autoValidate = true;
                                });
                                var isValid = _formKey.currentState.validate();
                                if (isValid) {
                                  try {
                                    final FirebaseUser user =
                                        await _auth.signInWithEmailAndPassword(
                                      email: mailController.text,
                                      password: pwdController.text,
                                    );
                                    debugPrint(user.email);
                                    var map = Map<String, dynamic>();

                                    map['origin'] = 'manual';
                                    map['email'] = mailController.text;

                                    map['created'] =
                                        FieldValue.serverTimestamp();

                                    Firestore.instance
                                        .collection('logins')
                                        .document()
                                        .setData(map);

                                    appModel.updateUser(
                                        email: mailController.text,
                                        first_name:
                                            mailController.text.split('@')[0]);

                                    Navigator.pushNamed(context, '/main');
                                  } on PlatformException catch (e) {
                                    debugPrint(e.toString());
                                    switch (e.code) {
                                      case ERROR_USER_NOT_FOUND:
                                        setState(() {
                                          this.emlErr = DemoLocalizations
                                              .of(context)
                                              .ERROR_USER_NOT_FOUND;
                                        });
                                        break;
                                      case ERROR_WRONG_PASSWORD:
                                        setState(() {
                                          this.pwdErr =
                                              DemoLocalizations.of(
                                                  context)
                                                  .ERROR_WRONG_PASSWORD;
                                        });

                                        break;
                                    }
                                  }
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
  clearPwdErr() {
    if (this.pwdErr != null)
      setState(() {
        this.pwdErr = null;
      });
  }

  clearEmlErr() {
    if (this.emlErr != null)
      setState(() {
        this.emlErr = null;
      });
  }
}
