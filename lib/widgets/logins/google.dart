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
    return RaisedButton(
      color: Colors.transparent,
      elevation: 0,
      onPressed: () {
        _handleGoogleSignIn();
      },
      child: const Text(
        'Login with google',
        style: TextStyle(fontSize: 30.0
        ),
      ),
    );
  }
}
