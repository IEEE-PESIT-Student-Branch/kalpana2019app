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
  Database database;
  @override
  void initState() {
    super.initState();
    database = new Database();
    database.initState();
  }

  @override
  void dispose() {
    super.dispose();
    database.dispose();
  }

  void login() {
    // database.teamid = _teamID.text;
    // database.appLogin(context, _teamID.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(50, 90, 50, 0),
              child: Image.asset('images/kalpana.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 60, 50, 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _teamID,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Team ID',
                  ),
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => login(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              elevation: 8,
              // color: Color(0xFF540187),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              color: Colors.yellow[300],
              textColor: Colors.black,
              // textColor: Colors.white,
              child: Text("LOGIN"),
              onPressed: login,
            )
          ],
        ),
      ),
    );
  }
}
