import 'package:flutter/material.dart';
import 'package:funkinator/l10n/bl.dart';
import 'package:funkinator/models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';
class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            child: ScopedModelDescendant<AppModel>(
              builder: (context, child, appModel) {
                return Text(DemoLocalizations.of(context).hello(
                    appModel.user_name.isEmpty
                        ? DemoLocalizations.of(context).guest
                        : appModel.user_name));
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(10,40);

}
