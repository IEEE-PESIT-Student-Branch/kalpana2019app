import 'package:firebase_database/firebase_database.dart';
class Doubt {
  String _teamid;
  int _flagLevel;
  String _domain;
  String _message;
  
  Doubt(this._domain,this._message, this._flagLevel, this._teamid);

  String get i => _teamid;
  String get d => _domain;
  String get m => _message;
  int get f => _flagLevel;

  Doubt.formSnapshot(DataSnapshot snap)
  {
    _teamid    = snap.value['i'];
    _domain    = snap.value['d'];
    _message   = snap.value['m'];
    _flagLevel = snap.value['f'];
  }

}