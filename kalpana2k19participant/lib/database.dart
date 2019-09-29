import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:kalpana2k19participant/model/Doubt.dart';
import 'package:kalpana2k19participant/page/Home.dart';

class Database{
  static final Database _singleton = new Database._internal();
  FirebaseDatabase db;
  DatabaseReference _helpRef;
  DatabaseReference _teamRef;
  DatabaseError error;
  String _teamid='';

  Database._internal(){
    db = new FirebaseDatabase();
    
  }
  
  factory Database(){
    return _singleton;
  }

  void initState(){
    //Reference to the help object
    _helpRef = db.reference().child('/help');
    //Reference to the team object
    _teamRef = db.reference().child('/team');
    db.setPersistenceEnabled(true);
    db.setPersistenceCacheSizeBytes(10000000);
    //Disabling sync to avoid unwanted data usage
    _helpRef.keepSynced(false);
    _teamRef.keepSynced(false);

    error=null;
  }

  String get teamid{
    if(_teamid!=null)
    return _teamid;
    else{
      print('Bad function call : getitemid');
      return 'Bad function call';
    }
  }

  void set teamid(String id){
    _teamid = id;
  }
  DatabaseError getError(){
    return error;
  }

  DatabaseReference getteam(){
    return _teamRef;
  }
  
  DatabaseReference gethelp(){
    return _helpRef;
  }

  
  void appLogin(BuildContext context, String teamid){
    _teamRef.once().then((DataSnapshot snap){
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

  void postdoubt(BuildContext context,Doubt doubt) async{
    await _helpRef.push().set(doubt.toJson());
  }

  void deletepost(Doubt doubt) async{
    await _helpRef.child(doubt.key).remove().then((_){
      print('Transaction complete: Data deleted');
    });
  }

  void updateUser(Doubt doubt) async {
    await _helpRef.child(doubt.key).update(doubt.toJson()).then((_) {
      print('Transaction  committed: Data updated');
    });
  }
   
  void dispose(){
    //cancel any stream subscription
  }

}