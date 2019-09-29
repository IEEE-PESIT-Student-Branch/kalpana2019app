import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/model/Event.dart';
import 'package:kalpana2k19participant/model/NoGlowScroll.dart';
import 'package:kalpana2k19participant/widget/ScheduleTile.dart';

class SchedulePage extends StatelessWidget {
  List<Event> event = [
    Event('4:00 PM - Registration Starts'),
    Event('4:45 PM - Inagauration Function'),
    Event('5:30 PM - Make-a-Thon Begins'),
    Event('8:00 PM - Dinner & Recreational Activities'),
    Event('11:30 PM - Round 1 Judging Begins'),
    Event('1:00 AM - Mid-night Snacks'),
    Event('7:30 AM - Breakfast'),
    Event('9:30 AM - Round 2 Judging Begins'),
    Event('12:30 PM - Lunch'),
    Event('3:00 PM - Final Judging Begins'),
    Event('4:00 PM - High Tea'),
    Event('4:30 PM - Valedictory Function'),
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
                ScrollConfiguration(
                  behavior: NoGlowScroll(),
                  child: Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext ctx, int index) {
                        return ScheduleTile(event[index]);
                      },
                      itemCount: event.length,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
