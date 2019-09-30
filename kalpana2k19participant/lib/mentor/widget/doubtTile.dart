import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/mentor/model/doubt.dart';
import 'package:kalpana2k19participant/mentor/database.dart';

class DoubtTile extends StatelessWidget {
  Doubt doubt;
  DoubtTile(this.doubt);
  Database database =new  Database();

  Future<void> claim() async {
    doubt.f = 1;
    print(doubt.toJson());
    await FirebaseDatabase.instance.reference().child('/help').child(doubt.key).update({'f':1});
    await FirebaseDatabase.instance.reference().child('/claim').push().set({'c':doubt.key,'j':database.judgeID,'i': doubt.i,
      'm': doubt.m,
      'f': doubt.f});
 
    print("You just claimed it");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _checkstate(),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ListTile(
        trailing: Container(
            child: RaisedButton(
          child: Text('Claim'),
          color: Colors.blue,
          onPressed: claim,
        )),
        title: Container(
          height: 40,
          child: Text(
            doubt.m,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 0.67),
            ),
          ),
        ),
        subtitle: Text('Click to View'),
      ),
    );
  }
  Color _checkstate(){
    switch(doubt.f)
    {
      case 0:
      return Colors.blue;
      break;
      case 1:
      return Colors.green;
      break;
      default:
      return Colors.red;
    }  }
}
