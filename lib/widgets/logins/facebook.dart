import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacebookLoginWidget extends StatelessWidget {

  Future<dynamic>  _handleFaceBookSignIn() async {
    final login = FacebookLogin();
    final result = await login.logInWithReadPermissions(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = JsonDecoder().convert(graphResponse.body);

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
         $profile
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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
          DemoLocalizations.of(context).login_with,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                ' facebook',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
