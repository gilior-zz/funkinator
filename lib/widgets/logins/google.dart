import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginWidget extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn() async {
    try {
      var s = await _googleSignIn.signIn();
      debugPrint('$s');
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        _handleGoogleSignIn();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Login with',
            style: TextStyle(fontSize: 30.0),
          ),
          const Text(' g',
              style: TextStyle(fontSize: 30.0, color: Colors.blue)),
          const Text(' o', style: TextStyle(fontSize: 30.0, color: Colors.red)),
          const Text(' o',
              style: TextStyle(fontSize: 30.0, color: Colors.yellow)),
          const Text(' g',
              style: TextStyle(fontSize: 30.0, color: Colors.blue)),
          const Text(' l',
              style: TextStyle(fontSize: 30.0, color: Colors.green)),
          const Text(' e', style: TextStyle(fontSize: 30.0, color: Colors.red)),
        ],
      ),
    );
  }
}
