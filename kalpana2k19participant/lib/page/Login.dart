import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:kalpana2k19participant/database.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _teamID = TextEditingController();
  final DBref = FirebaseDatabase.instance.reference().child("/teams");

 void login() {
      //Check if Team-ID is valid
    // DBref.child("1").set({
    //   'id':'This is sample data'
    // });
    Database.appLogin(context, _teamID.text);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF540187),
                Color(0xFF020057),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
                child: Stack(
                  children: <Widget>[
                    Text(
                      'Kalpana',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'kau',
                        fontSize: 68,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(170, 75, 0, 0),
                      child: Text(
                        '2K19',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'kau',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
                child: TextField(
                  controller: _teamID,
                  decoration: InputDecoration(    
                  border: OutlineInputBorder(), labelText: 'Team ID'),
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_)=>login(),

                ),
              ),
              SizedBox(height: 10,),
              RaisedButton(elevation: 8,
              color: Color(0xFF540187),
                textColor: Colors.white,
                child: Icon(Icons.arrow_forward),
                onPressed: login,)
            ],
          ),
        ),
      ),
    );
   
  }
}
