

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/page/Home.dart';

class Database{
  
  
  DatabaseReference dbHelpRef = FirebaseDatabase.instance.reference().child("/help");


  static void appLogin(BuildContext context, String teamid){
    DatabaseReference dbTeamRef = FirebaseDatabase.instance.reference().child("/team");
      dbTeamRef.once().then((DataSnapshot snap){
        print(snap.value);
        var res = Map<String,dynamic>.from(snap.value);
        res.forEach((key, value){
          if(key==teamid){
            print("Login sucessfull");
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNavPage()));
          }else{
            print("Team not present");
          return;
          }
        });
      });
  }
}