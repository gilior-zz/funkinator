import 'package:flutter/material.dart';
import 'package:funkinator/widgets/logins/login.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('funkinator'),
      ),
      body: LoginWidget(),
    );
  }

//

}

enum Department { treasury, state }
