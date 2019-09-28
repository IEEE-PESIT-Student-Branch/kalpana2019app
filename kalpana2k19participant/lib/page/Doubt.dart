

import 'package:flutter/material.dart';

class DoubtPage extends StatefulWidget {
  
  
  @override
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select your domain'),),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('AI'),
          onPressed: ()=>_handelPressed('AI'),
          ),
      ],),
    );
  }

  void _handelPressed(String domain){
    _ackAlert(context);
  }
}

Future<void> _ackAlert(BuildContext context){
  return showDialog<void>(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Description',textAlign: TextAlign.center,),
        content: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          height: 300.0,
          padding: EdgeInsets.all(10.0),
          child: TextField(
            maxLines: 12,
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.black
          ),
          decoration: InputDecoration.collapsed(),
          )
        ) ,
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: (){
              Navigator.of(context).pop();
            },)
        ],
      );
    }
  );
}
