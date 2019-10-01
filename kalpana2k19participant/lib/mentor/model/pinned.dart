import 'package:firebase_database/firebase_database.dart';
class Pinned {
  String key;
  String _ckey;
  String _judegID;
  String _teamid;
  int _flagLevel;
  String _message;
  
  Pinned(this._ckey, this._judegID,this._message, this._flagLevel, this._teamid);

  String get c {
    return _ckey;
  }
  String get j {
    return _judegID;
  }
  String get i {
    return _teamid;
  }
  String get m {
    return _message;
  }
  int get f {
    return _flagLevel;
  }

  void set c(String str) => _ckey = str;
  void set i(String str) => _teamid = str;
  void set m(String str) => _message = str;
  void set f(int i)      => _flagLevel = i;
  void set j(String str) => _judegID = str;

  Pinned.formSnapshot(DataSnapshot snap)
  {
    key        = snap.key;
    _ckey      = snap.value['c'];
    _judegID   = snap.value['j'];
    _teamid    = snap.value['i'];
    _message   = snap.value['m'];
    _flagLevel = snap.value['f'];
  }

  toJson(){
    return{
      'c': _ckey,
      'j': _judegID,
      'i': _teamid,
      'm': _message,
      'f': _flagLevel,
    };
  }
}