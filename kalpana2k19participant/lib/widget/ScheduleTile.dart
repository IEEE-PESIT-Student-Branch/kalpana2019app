import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/model/Event.dart';

class ScheduleTile extends StatelessWidget {
  Event event;
  //Text Styles
  TextStyle h = TextStyle(
    fontFamily: 'kau',
    fontSize: 17,
    color: Colors.white,
  );
  TextStyle sub = TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(255, 255, 255, 0.67),
  );
  //Card Color
  Color color = Color(0xFF08284F);

  ScheduleTile(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ListTile(
        title: Container(
          child: Text(
            event.title,
            style: sub,
          ),
        ),
      ),
    );
  }
}
