import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('funkinator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _handleSignIn();
              },
              child: const Text(
                'Login with google',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      var s = await _googleSignIn.signIn();
      debugPrint('$s');
    } catch (error) {
      print(error);
    }
  }
}
