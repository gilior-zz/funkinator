import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/login-widgets/login.widget.dart';
import 'package:funkinator/widgets/common-widgets/my-app-bar.widget.dart';

import 'package:scoped_model/scoped_model.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar:MyAppBarWidget() ,
      body: LoginWidget(),
    );
  }

//

}

