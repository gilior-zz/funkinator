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
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

//  DocumentSnapshot dropdownValue;
  var _mySelection;
  bool isChanged = false;
  List<DocumentSnapshot> devices = [];
  List<DocumentSnapshot> methods = [];

  @override
  Widget build(BuildContext context) {
    Firestore.instance.collection('devices').getDocuments().then((_devices) {
      setState(() {
        devices = _devices.documents;
      });
    });
    Firestore.instance.collection('methods').getDocuments().then((_methods) {
      setState(() {
        methods = _methods.documents;
      });
    });
    return Column(
      children: <Widget>[
        Card(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      DropdownButtonFormField<String>(
                          value: _mySelection,
                          onChanged: (String newValue) {
                            setState(() {
                              isChanged = true;
                              print(newValue);
                              _mySelection = newValue;
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
          children: <Widget>[
            RadioListTile<DocumentSnapshot>(
              title: const Text('Lafayette'),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
