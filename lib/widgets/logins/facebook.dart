import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginWidget extends StatelessWidget {
  void _handleFaceBookSignIn() async {
    final login = FacebookLogin();
    final FacebookLoginResult result =
        await login.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        debugPrint('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        debugPrint('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        debugPrint('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        _handleFaceBookSignIn();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Login with',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(' '),
          Text(' facebook ',
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  fontSize: 30.0))
        ],
      ),
    );
  }
}
