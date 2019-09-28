import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart' as prefix0;
import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/database.dart';

class DoubtPage extends StatefulWidget {
  @override
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  // @override
  // void initState(){
  //   FirebaseDatabase db =new FirebaseDatabase();
  //   db.setPersistenceEnabled(false);
  //   db.reference().keepSynced(false);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your domain'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('AI'),
            onPressed: () => _handelPressed('AI'),
          ),
        ],
      ),
    );
  }

  void _handelPressed(String domain) {
    _ackAlert(context, domain);
  }
}

Future<void> load(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        // return AlertDialog(
        // backgroundColor: Colors.transparent,
        //content:
        return Material(
            type: MaterialType.transparency,
            child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
            );
      });
}

Future<void> _ackAlert(BuildContext context, String domain) async {
  final _message = TextEditingController();
  String _domain = domain;
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('Description',textAlign: TextAlign.center,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Description',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: _message,
                    decoration: InputDecoration(
                      hintText: "....",
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                    maxLength: 75,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () async {
                    load(context);
                    await Database.postdoubt(context, _domain, _message.text);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );
      });
}
