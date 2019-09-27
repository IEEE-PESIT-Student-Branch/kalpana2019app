import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/model/Event.dart';
import 'package:kalpana2k19participant/widget/ScheduleTile.dart';

class SchedulePage extends StatelessWidget {
  List<Event> event = [
    Event('7:00 am - Registration'),
    Event('8:00 am - Inagauration'),
    Event(''),
    Event(''),
    Event(''),
    Event(''),
    Event(''),
    Event(''),
    Event(''),
    Event(''),
  


  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF038396),
            Color(0xFF4138B2),
          ],
        )),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Kau',
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext ctx, int index) {
                      return ScheduleTile(event[index]);
                    },
                    itemCount: event.length,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
