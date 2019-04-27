import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/screens/game.dart';
import 'package:funkinator/screens/login.dart';
import 'package:funkinator/screens/signup.dart';
import 'package:scoped_model/scoped_model.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title),
      ),
    );
  }
}

void main() {
  final cart = AppModel();

  // You could optionally connect [cart] with some database here.

  runApp(
    ScopedModel<AppModel>(
      model: cart,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: Login_Screen(),
      title: 'DemoLocalizations.of(context).title',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/signUp': (context) => Signup_Screen(),
        '/game': (context) => Game_Screen(),
      },
    );
  }
}
