import 'package:firebase_database/firebase_database.dart';
class Doubt {
  String key;
  String _teamid;
  int _flagLevel;
  String _message;
  
  Doubt(this._message, this._flagLevel, this._teamid);

  String get i {
    return _teamid;
  }
  String get m {
    return _message;
  }
  int get f {
    return _flagLevel;
  }

  void set i(String str) => _teamid = str;
  void set m(String str) => _message = str;
  void set f(int i)      => _flagLevel = i;


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