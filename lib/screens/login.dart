import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/widgets/logins/login.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(child: Text(DemoLocalizations.of(context).hello('lior'))),
            Expanded(
                child: Flex(
                    direction: Axis.horizontal,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[Text('funkinator')])),
          ],
        ),
      ),
      body: LoginWidget(),
    );
  }

//

}

enum Department { treasury, state }
