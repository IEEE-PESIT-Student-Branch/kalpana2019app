import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/page/Doubt.dart';

import 'package:kalpana2k19participant/page/Help.dart';
import 'package:kalpana2k19participant/page/Schedule.dart';
import 'package:kalpana2k19participant/page/Counter.dart';

class HomeNavPage extends StatefulWidget {
  @override
  _HomeNavPageState createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  int _selectedPage = 1;
  final _pageoptions = [
    TimerPage(),
    DoubtPage(),
    SchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageoptions[_selectedPage],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF4138B2)),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              title: Text('Help'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              title: Text('Timer'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
