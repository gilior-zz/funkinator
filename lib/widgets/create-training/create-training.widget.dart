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

//  DocumentSnapshot dropdownValue;
  var _mySelection;
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('devices')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
//                          print(snapshot.connectionState.toString());
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Text('Loading...');
                            default:
//                              print(snapshot.connectionState.toString());
//                              print( snapshot.data.documents);
                              if (!isChanged)
                                _mySelection =
                                    snapshot.data.documents[0].documentID;
                              return DropdownButtonFormField<String>(
                                value: _mySelection,
                                onChanged: (String newValue) {
                                  setState(() {
                                    isChanged = true;
                                    print(newValue);
                                    _mySelection = newValue;
                                  });
                                },
                                items: snapshot.data.documents
                                    .map((DocumentSnapshot document) {
                                  return DropdownMenuItem<String>(
//                                    key: Key(document.documentID),
                                    child: Text(document.data['name']),
                                    value: document.documentID,
                                  );
                                }).toList(),
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
