import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';

class MainGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(5.0),
          crossAxisSpacing: 5.0,
          crossAxisCount: 2,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_training');

                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: Text(DemoLocalizations.of(context).create_training)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {Navigator.pushNamed(context, '/manage_trainings');},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                  child: Text(DemoLocalizations.of(context).manage_trainings)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {Navigator.pushNamed(context, '/start_training');},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                  child: Text(DemoLocalizations.of(context).start_training)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {Navigator.pushNamed(context, '/statistics');},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                  child: Text(DemoLocalizations.of(context).statistics)),
            ),
          ],
        ),
      ],
    );
  }
}
