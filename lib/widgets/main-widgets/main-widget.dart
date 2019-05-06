import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
class MainGridWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      padding: const EdgeInsets.all(5.0),
      crossAxisSpacing: 5.0,
      crossAxisCount: 2,
      children: <Widget>[
        RaisedButton(onPressed: (){}, child: Text(DemoLocalizations.of(context).create_training)),
        RaisedButton(onPressed:  (){}, child: Text(DemoLocalizations.of(context).manage_trainings)),
        RaisedButton(onPressed:  (){}, child: Text(DemoLocalizations.of(context).start_training)),
        RaisedButton(onPressed:  (){}, child: Text(DemoLocalizations.of(context).statistics)),
      ],
    );
  }

}