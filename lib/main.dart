import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:funkinator/screens/create-training.screen.dart';
import 'package:funkinator/screens/login.screen.dart';
import 'package:funkinator/screens/main.screen.dart';
import 'package:funkinator/screens/signup.screen.dart';
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
  final appModel = AppModel();

  // You could optionally connect [cart] with some database here.

  runApp(
    ScopedModel<AppModel>(
      model: appModel,
      child: MyApp(),
//      child:SafeArea(child: MyApp()) ,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<AppModel>(builder: (context, child, appModel) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
//      home: Login_Screen(),
        title: 'DemoLocalizations.of(context).title',
        theme: ThemeData.dark(),
        onGenerateRoute: (RouteSettings settings) {
          debugPrint(settings.name);
          switch (settings.name) {
            case '/':
            case '/main':
              return MaterialPageRoute(
                  settings: settings,
                  builder: (BuildContext context) =>
                      appModel.user_name.isNotEmpty
                          ? Main_Screen()
                          : SafeArea(
                              child: Main_Screen(),
                            ));
            case '/signUp':
              return MaterialPageRoute(
                  settings: settings,
                  builder: (BuildContext context) => Signup_Screen());
              break;
            case '/login':
              return MaterialPageRoute(
                  settings: settings,
                  builder: (BuildContext context) => Login_Screen());
              break;

            case '/create_training':
              return MaterialPageRoute(
                  settings: settings,
                  builder: (BuildContext context) =>
                      SafeArea(child: Create_Training_Screen()));
          }
          debugPrint('$settings');
        },
        initialRoute: '/',
//      routes: {
//        // When we navigate to the "/" route, build the FirstScreen Widget
//        // When we navigate to the "/second" route, build the SecondScreen Widget
//        '/': (context) => Login_Screen(),
//        '/signUp': (context) => Signup_Screen(),
//        '/game': (context) => Game_Screen(),
//      },
      );
    });
  }
}
