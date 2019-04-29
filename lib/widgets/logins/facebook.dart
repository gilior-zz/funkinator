import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

const FACEBOOK_URL = 'https://graph.facebook.com/v2.12/me';
const FIELDS = 'fields=name,first_name,last_name,email';

class FacebookLoginWidget extends StatelessWidget {
  Future<Response> _handleFaceBookSignIn() async {
    final login = FacebookLogin();
    final result = await login.logInWithReadPermissions(['email']);
    final token = result.accessToken.token;
    final graphResponse =
        await http.get(FACEBOOK_URL + '?' + FIELDS + '&access_token=${token}');
    return graphResponse;
    final profile = JsonDecoder().convert(graphResponse.body);
    return profile;
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        final FacebookAccessToken accessToken = result.accessToken;
//        debugPrint('''
//         Logged in!
//         Token: ${accessToken.token}
//         User id: ${accessToken.userId}
//         Expires: ${accessToken.expires}
//         Permissions: ${accessToken.permissions}
//         Declined permissions: ${accessToken.declinedPermissions}
//         $profile
//         ''');
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        debugPrint('Login cancelled by the user.');
//        break;
//      case FacebookLoginStatus.error:
//        debugPrint('Something went wrong with the login process.\n'
//            'Here\'s the error Facebook gave us: ${result.errorMessage}');
//        break;
//    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<AppModel>(builder: (context, child, appModel) {
      return FlatButton(
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
          onPressed: () async {
            var loginInfo = await _handleFaceBookSignIn();
            final profile = JsonDecoder().convert(loginInfo.body) as LinkedHashMap;
            debugPrint('$profile');
            appModel.updateUser(
                email: profile['email'],
                id: profile['id'],
                first_name: profile['first_name'],
                last_name: profile['last_name']);
          });
    });
  }
}
