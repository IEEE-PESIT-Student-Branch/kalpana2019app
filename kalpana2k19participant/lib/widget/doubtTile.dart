import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/model/Doubt.dart';

class Doubtcard extends StatelessWidget {
  Doubt doubt;
  Doubtcard(this.doubt);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
      // child: ListTile(
      //   title: doubt.d,
      //   subtitle: doubt.m,)
      //),      
    );
  }
}