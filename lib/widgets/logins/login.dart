import 'package:flutter/material.dart';
import 'package:funkinator/widgets/logins/facebook.dart';
import 'package:funkinator/widgets/logins/google.dart';
import 'package:funkinator/widgets/logins/manual.dart';

class LoginWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GoogleLoginWidget(),
          FacebookLoginWidget(),
          Text(
            '------ or ------',
            style: TextStyle(fontSize: 20.0),
          ),
          ManualLogin(), //
        ],
      ),
    );
  }

}
