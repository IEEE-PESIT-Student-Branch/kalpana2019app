import 'package:firebase_database/firebase_database.dart';
import 'package:kalpana2k19participant/mentor/model/doubt.dart';


class Database{
  static final Database _singleton = new Database._internal();
  FirebaseDatabase db;
  DatabaseReference _helpRef;
  DatabaseReference _claimRef;
  DatabaseError error;
  String judgeID;

  Database._internal(){
    db = new FirebaseDatabase();
    
  }
  
  factory Database(){
    return _singleton;
  }

  void initState(){
    _helpRef = db.reference().child('/help');
    _claimRef = db.reference().child('/claim');
    db.setPersistenceEnabled(true);
    db.setPersistenceCacheSizeBytes(10000000);
    //Disabling sync to avoid unwanted data usage
    _helpRef.keepSynced(false);
    _claimRef.keepSynced(false);
    error=null;
    judgeID='';
  }

  DatabaseReference getclaimRef(){
    return _claimRef;
  }
  
  DatabaseReference gethelpRef(){
    return _helpRef;
  }

  Future<void> updateFlag(Doubt item) async{
    print('update starting');
    await _helpRef.child(item.key).update(item.toJson()).then((_){
      print("Flag value changed");
    });
  }

  deletepost(Doubt doubt) async{
    await _helpRef.child(doubt.key).remove().then((_){
      print('entry deleted');
    });
  }

  void dispose(){
    //cancel any stream subscription
  }
}