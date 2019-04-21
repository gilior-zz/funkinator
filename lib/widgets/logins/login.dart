import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/widgets/logins/facebook.dart';
import 'package:funkinator/widgets/logins/google.dart';
import 'package:funkinator/widgets/logins/manual.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleLoginWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FacebookLoginWidget(),
            ),
            Text(
              DemoLocalizations.of(context).or,
              style: TextStyle(fontSize: 20.0),
            ),
            ManualLogin(), //
          ],
        ),
      ],
    ));
  }
}
