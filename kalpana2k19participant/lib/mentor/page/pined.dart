import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:kalpana2k19participant/mentor/model/pinned.dart';
import 'package:kalpana2k19participant/mentor/widget/pinnedTile.dart';
import 'package:kalpana2k19participant/mentor/database.dart';

class PinnedPage extends StatefulWidget {
  @override
  _PinnedPageState createState() => _PinnedPageState();
}

class _PinnedPageState extends State<PinnedPage> {
  List<Pinned> pinnedList = [];
  Database database;
  DatabaseReference helpRef;
  DatabaseReference claimRef;
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    database = new Database();
    database.initState();
    claimRef = FirebaseDatabase.instance.reference().child('/claim');
    claimRef.onChildAdded.listen(_onDataAdded);
    claimRef.onChildChanged.listen(_onDataChanged);
    claimRef.onChildRemoved.listen(_onDataRemoved);
    database.judgeID = '3000';
  }

  _onDataRemoved(Event event) {
    var old = pinnedList.singleWhere((entry) {
      return entry.key ==
          event.snapshot.key; 
    });
    int index = pinnedList.indexOf(old);
    Pinned removedItem = pinnedList.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(context, removedItem, animation);
    };
    _listkey.currentState.removeItem(index, builder);
  }

  _onDataAdded(Event event) {
    print(event.snapshot.value);
   // if (event.snapshot.value['j'] == database.judgeID) {
    Pinned item = Pinned.formSnapshot(event.snapshot);
    print(item.c);
      pinnedList.insert(0, item);
      _listkey.currentState.insertItem(0);
    //}
  }

  _onDataChanged(Event event) {
    var old = pinnedList.singleWhere((entry) {
      return entry.key == event.snapshot.key
        &&
            event.snapshot.value['j'] == database.judgeID;
     });
    _listkey.currentState.setState(() {
      pinnedList[pinnedList.indexOf(old)] = Pinned.formSnapshot(event.snapshot);
    });
  }

  @override
  void dispose() {
    super.dispose();
    database.dispose();
  }

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
                    'Pinned',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Kau',
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Expanded(
                  child: AnimatedList(
                    key: _listkey,
                    initialItemCount: pinnedList.length,
                    itemBuilder: (context, index, animation) =>
                        _buildItem(context, pinnedList[index], animation),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, Pinned item, Animation<double> animation) {
    return GestureDetector(
      child: PinnedTile(item),
      onTap: () {
        alert(context, item);
        print("Show alert");
      },
    );
  }

  Future<void> alert(BuildContext context, Pinned doubt) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Container(
                      height: 190,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(doubt.m)),
                  Row(children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              //bottomRight: Radius.circular(32.0)
                            ),
                          ),
                          child: Text(
                            "Unsolved",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          //Do nothing
                          print('Not Solved');
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(32.0)),
                          ),
                          child: Text(
                            "Solved",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          //Do nothing
                          print("Solved");
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        });
  }
}


