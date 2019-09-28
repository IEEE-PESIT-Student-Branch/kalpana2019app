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
    fontSize: 14,
    color: Color.fromRGBO(255, 255, 255, 0.67),
  );
  //Card Color
  Color color = Color(0xFF08284F);

  ScheduleTile(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: Card(
        elevation: 6,
        color: color,
        child: Container(
          alignment: AlignmentDirectional(-0.8, 0.0),
          child: Text(
            event.title,
            style: sub,
          ),
        ),
      ),
    );
  }
}
