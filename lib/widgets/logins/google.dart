import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';

class GoogleLoginWidget extends StatelessWidget {
  final appModel = AppModel();
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount> _handleGoogleSignIn() async {
      var loginInfo = await _googleSignIn.signIn();
      debugPrint('$loginInfo');
      return loginInfo;
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<AppModel>(builder: (context, child, appModel) {
      return FlatButton(
        onPressed: () async {
          var loginInfo = await _handleGoogleSignIn();
          appModel.updateUser(
              email: loginInfo.email,
              first_name: loginInfo.displayName.split(' ')[0],
              last_name: loginInfo.displayName.split(' ')[1],
              id: loginInfo.id);
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
