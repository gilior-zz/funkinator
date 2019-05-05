import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class GoogleLoginWidget extends StatelessWidget {
  final appModel = AppModel();
  GoogleSignIn _googleSignIn = GoogleSignIn();

//  Future<GoogleSignInAccount> _handleGoogleSignIn() async {
//    var loginInfo = await _googleSignIn.signIn();
//    debugPrint('$loginInfo');
//    return loginInfo;
//  }

  Future<FirebaseUser> _handleGoogleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint("signed in " + user.displayName);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<AppModel>(builder: (context, child, appModel) {
      return FlatButton(
        onPressed: () async {
          var loginInfo = await _handleGoogleSignIn();
//          FirebaseUser user = await FirebaseAuth.instance.sign(
//              idToken: gSA.idToken, accessToken: gSA.accessToken);

          //update firebase
//          var user = new User(
//              email: loginInfo.email,
//              first_name: loginInfo.displayName.split(' ')[0],
//              last_name: loginInfo.displayName.split(' ')[1],
//              id: loginInfo.uid);

//

          var map = Map<String, dynamic>();

          map['origin'] = 'google';
          map['email'] = loginInfo.email;
          map['phone'] = loginInfo.phoneNumber;
          map['first_name'] = loginInfo.displayName.split(' ')[0];
          map['last_name'] = loginInfo.displayName.split(' ')[1];
          map['id'] = loginInfo.uid;
          map['created'] = FieldValue.serverTimestamp();
          Firestore.instance.collection('logins').document().setData(map);

          appModel.updateUser(
              email: loginInfo.email,
              first_name: loginInfo.displayName.split(' ')[0],
              last_name: loginInfo.displayName.split(' ')[1],
              id: loginInfo.uid);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DemoLocalizations.of(context).login_with,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                Flex(
                  direction: Axis.horizontal,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    const Text(' g',
                        style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                    const Text(' o',
                        style: TextStyle(fontSize: 20.0, color: Colors.red)),
                    const Text(' o',
                        style: TextStyle(fontSize: 20.0, color: Colors.yellow)),
                    const Text(' g',
                        style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                    const Text(' l',
                        style: TextStyle(fontSize: 20.0, color: Colors.green)),
                    const Text(' e',
                        style: TextStyle(fontSize: 20.0, color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
