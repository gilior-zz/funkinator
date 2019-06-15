import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/const.dart';
class Create_Training_Widget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Create_Training_State();
  }
}

class Create_Training_State extends State<Create_Training_Widget> {
  final _formKey = GlobalKey<FormState>();
  String _my_method = '';
  String _my_device='';

  @override
  void initState() {
    // TODO: implement initState
    Firestore.instance.collection('devices').getDocuments().then((_devices) {
      setState(() {
        devices = _devices.documents;
        _my_device = devices[0].documentID;
      });
    });
    Firestore.instance.collection('methods').getDocuments().then((_methods) {
      setState(() {
        methods = _methods.documents;
        _my_method = _methods.documents[0].documentID;
      });
    });
    super.initState();
  }

  bool isChanged = false;
  List<DocumentSnapshot> devices = [];
  List<DocumentSnapshot> methods = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                SizedBox(
                    width: 150,
                    child: DropdownButtonFormField<String>(
                        value: _my_device,
                        onChanged: (String newValue) {
                          setState(() {
                            isChanged = true;
                            print(newValue);
                            _my_device = newValue;
                          });
                        },
                        items: devices.map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
//                                    key: Key(document.documentID),
                            child: Text(document.data['name']),
                            value: document.documentID,
                          );
                        }).toList())),
              ]),
              ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  children: methods.map((DocumentSnapshot document) {
                    return RadioListTile<String>(
                        title: Text(document.data['name']),
                        value: document.documentID,
                        groupValue: _my_method,
                        onChanged: (String value) {
                          setState(() {
                            _my_method = value;
                          });
                        });
                  }).toList()),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Form_Input_Widget(
                        errClearFunc: this.clearPwdErr,
                        errorText: this.pwdErr,
                        textEditingController: this.pwdController,
                        textInputType: TextInputType.text,
                        validator: ValidateIsEmpty),
                  ),
                  Expanded(
                    child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: const FlutterLogo(),
                    ),
                  ),
                ],
              )
            ]));
  }
}
