import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/signup-widgets/email.widget.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpWidgetState();
  }
}

class SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController mailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController_2 = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Container(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 50,
                                      child: Email_Widget(
                                        autoValidate: _autoValidate,
                                        mailController: mailController,
                                      ))),
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
                                          _formKey.currentState.validate();
                                          setState(() {
                                            _autoValidate = true;
                                          });
                                          return;
                                          debugPrint('foo');
//                                        return;
                                          final FirebaseUser user = await _auth
                                              .createUserWithEmailAndPassword(
                                            email: mailController.text,
                                            password: pwdController.text,
                                          );
                                          debugPrint(user.displayName);

                                          await _auth
                                              .signInWithEmailAndPassword(
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
                                              first_name: mailController.text
                                                  .split('@')[0]);

                                          Navigator.pushNamed(context, '/main');
                                        },
                                        child: Text(
                                            DemoLocalizations.of(context)
                                                .submit),
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
                )));
      }),
    );
  }
}
