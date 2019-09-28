

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/page/Home.dart';

class Database{
  static final DatabaseReference dbTeamRef = FirebaseDatabase.instance.reference();

  static void appLogin(BuildContext context, String teamid){
    
      dbTeamRef.child("/team").once().then((DataSnapshot snap){
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

  static Future<void> postdoubt(BuildContext context, String domian, String message) async{
    await dbTeamRef.child("/help").push().set({
      'd': '$domian',
      'm': '$message'
    });

  }

}