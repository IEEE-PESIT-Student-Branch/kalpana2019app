import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/page/Login.dart';
import 'package:kalpana2k19participant/page/Home.dart';
import 'package:kalpana2k19participant/page/Doubt.dart';

void main() => runApp(Kalpana2k19());

class Kalpana2k19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalpana Participant App',
      initialRoute:'/',
      routes: {
        '/'     : (BuildContext context) => DoubtPage(),
        '/home' : (context) => HomeNavPage(),
        
      },
    );
  }
}
