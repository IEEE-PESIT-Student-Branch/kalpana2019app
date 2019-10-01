import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/mentor/model/pinned.dart';

class PinnedTile extends StatelessWidget {
  Pinned doubt;
  PinnedTile(this.doubt);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ListTile(
        title: Container(
          height: 40,
          child: Text(
            'Location',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 0.67),
            ),
          ),
        ),
        subtitle: Text('Click to View description'),
      ),
    );
  }
}