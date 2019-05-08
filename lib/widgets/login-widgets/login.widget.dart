import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/widgets/login-widgets/facebook.widget.dart';
import 'package:funkinator/widgets/login-widgets/google.widget.dart';
import 'package:funkinator/widgets/login-widgets/manual.widget.dart';


class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
          child: Text(
            DemoLocalizations.of(context).or,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ManualLoginWidget(),
        ), //
      ],
    );
  }
}
