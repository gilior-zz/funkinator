import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  String _my_device;
  bool isChanged = false;
  List<DocumentSnapshot> devices = [];
  List<DocumentSnapshot> methods = [];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
          child: Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    DropdownButtonFormField<String>(
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
                        }).toList()),
                  ])))),
      Column(
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
      }).toList())
    ]);
  }
}
