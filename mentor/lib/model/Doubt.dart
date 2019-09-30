import 'package:firebase_database/firebase_database.dart';
class Doubt {
  String key;
  String _teamid;
  int _flagLevel;
  String _message;
  
  Doubt(this._message, this._flagLevel, this._teamid);

  String get i => _teamid;
  String get m => _message;
  int get f => _flagLevel;

  void set f(int i)
   {_flagLevel=i;}

  Doubt.formSnapshot(DataSnapshot snap)
  {
    key        = snap.key;
    _teamid    = snap.value['i'];
    _message   = snap.value['m'];
    _flagLevel = snap.value['f'];
  }
  toJson(){
    return{
      'i': _teamid,
      'm': _message,
      'f': _flagLevel,
    };
  }
}