import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/widgets/common-widgets/my-app-bar.widget.dart';
import 'package:funkinator/widgets/signup-widgets/signup.widget.dart';

import 'package:scoped_model/scoped_model.dart';

class Signup_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SignUpWidget()
    );
  }
}
