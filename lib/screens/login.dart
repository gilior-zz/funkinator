import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/logins/login.dart';
import 'package:scoped_model/scoped_model.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: ScopedModelDescendant<AppModel>(
                builder: (context, child, cart) {
                  return Text(DemoLocalizations.of(context).hello(
                      cart.user_name.isEmpty
                          ? DemoLocalizations.of(context).guest
                          : cart.user_name));
                },
              ), //
            ),
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
