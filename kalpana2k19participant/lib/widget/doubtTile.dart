import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/model/Doubt.dart';

class Doubtcard extends StatelessWidget {
  Doubt doubt;
  Doubtcard(this.doubt);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: _checkstate(),
      margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: ListTile(
        subtitle: Text(doubt.m),
      )      
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