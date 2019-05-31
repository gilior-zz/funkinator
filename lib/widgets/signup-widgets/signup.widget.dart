import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/signup-widgets/email.widget.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/services.dart';

import '../../models/const.dart';

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

  String emlErr = null;
  String pwdErr = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mailController.text = 'a@a.com';
    pwdController_2.text = '1q2w3e1q2w3e';
    pwdController.text = '1q2w3e1q2w3e';
  }

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
                                  padding: const EdgeInsets.all(8.0), //
                                  child: buildWidget(
                                      context: context,
                                      errClearFunc: this.clearEmlErr,
                                      errorText: this.emlErr,
                                      labelText:
                                          DemoLocalizations.of(context).email,
                                      textEditingController:
                                          this.mailController,
                                      textInputType: TextInputType.emailAddress,
                                      validator: validateEmail)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0), //
                                  child: buildWidget(
                                      context: context,
                                      errClearFunc: this.clearPwdErr,
                                      errorText: this.pwdErr,
                                      labelText:
                                          DemoLocalizations.of(context).pwd,
                                      textEditingController: this.pwdController,
                                      textInputType: TextInputType.text,
                                      validator: ValidateIsEmpty)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0), //
                                  child: buildWidget(
                                      context: context,
                                      errClearFunc: this.clearPwdErr,
                                      errorText: this.pwdErr,
                                      labelText:
                                          DemoLocalizations.of(context).pwd_2,
                                      textEditingController:
                                          this.pwdController_2,
                                      textInputType: TextInputType.text,
                                      validator: ValidateIsEmpty)),
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
                                          var isValid =
                                              _formKey.currentState.validate();
                                          if (isValid) {
                                            try {
                                              //signup user
                                              final FirebaseUser user = await _auth
                                                  .createUserWithEmailAndPassword(
                                                email: mailController.text,
                                                password: pwdController.text,
                                              );
                                              debugPrint(user.displayName);

                                              // signin user
                                              await _auth
                                                  .signInWithEmailAndPassword(
                                                email: mailController.text,
                                                password: pwdController.text,
                                              );

                                              // feed logins table
                                              var map =
                                                  Map<String, dynamic>(); //
                                              map['origin'] = 'manual';
                                              map['email'] =
                                                  mailController.text;
                                              map['created'] =
                                                  FieldValue.serverTimestamp();

                                              // update app-model
                                              appModel.updateUser(
                                                  email: mailController.text,
                                                  first_name: mailController
                                                      .text
                                                      .split('@')[0]);

                                              //navigate to main screen
                                              Navigator.pushNamed(
                                                  context, '/main');
                                            } on PlatformException catch (e) {
                                              debugPrint(e.toString());
                                              switch (e.code) {
                                                case ERROR_EMAIL_ALREADY_IN_USE:
                                                  setState(() {
                                                    this.emlErr = DemoLocalizations
                                                            .of(context)
                                                        .ERROR_EMAIL_ALREADY_IN_USE;
                                                  });
                                                  break;
                                                case ERROR_WEAK_PASSWORD:
                                                  setState(() {
                                                    this.pwdErr =
                                                        DemoLocalizations.of(
                                                                context)
                                                            .ERROR_WEAK_PASSWORD;
                                                  });

                                                  break;
                                              }
                                            }
                                          }

                                          return;
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

  Form_Widget buildWidget(
      {BuildContext context,
      TextEditingController textEditingController,
      String labelText,
      TextInputType textInputType,
      Function validator,
      String errorText,
      Function errClearFunc}) {
    return Form_Widget(
      autoValidate: _autoValidate,
      textEditingController: textEditingController,
      labelText: labelText,
      textInputType: textInputType,
      validator: validator,
      errorText: errorText,
      errClearFunc: errClearFunc,
    );
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
