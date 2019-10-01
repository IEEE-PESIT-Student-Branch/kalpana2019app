import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/mentor/database.dart';
import 'package:kalpana2k19participant/mentor/model/doubt.dart';
import 'package:kalpana2k19participant/mentor/widget/doubtTile.dart';


class DoubtPage extends StatefulWidget {
  @override
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  List<Doubt> doubtlist = [];
  Database database;
  DatabaseReference helpRef;
  DatabaseReference claimRef;
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    database = new Database();
    database.initState();
    helpRef = database.gethelpRef();
    claimRef = database.getclaimRef();
    helpRef.onChildAdded.listen(_onDataAdded);
    helpRef.onChildChanged.listen(_onDataChanged);
    helpRef.onChildRemoved.listen(_onDataRemoved);
    database.judgeID = '100';
  }

  _onDataRemoved(Event event) {
    var old = doubtlist.singleWhere((entry) {
      return entry.key ==
          event.snapshot.key; 
    });
    int index = doubtlist.indexOf(old);
    Doubt removedItem = doubtlist.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(context, removedItem, animation);
    };
    _listkey.currentState.removeItem(index, builder);
  }

  _onDataAdded(Event event) {
    //if (event.snapshot.value['i'] == database.judgeID) {
      Doubt item = Doubt.formSnapshot(event.snapshot);
      //print(item.m);
      doubtlist.insert(0, item);
      _listkey.currentState.insertItem(0);
    }

  _onDataChanged(Event event) {
    var old = doubtlist.singleWhere((entry) {
      return entry.key == event.snapshot.key;
      // &&
      //     event.snapshot.value['i'] == database.judgeID;
    });
    _listkey.currentState.setState(() {
      doubtlist[doubtlist.indexOf(old)] = Doubt.formSnapshot(event.snapshot);
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
      //type: MaterialType.transparency,
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
                    'Doubts',
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
                    initialItemCount: doubtlist.length,
                    itemBuilder: (context, index, animation) =>
                        _buildItem(context, doubtlist[index], animation),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, Doubt item, Animation<double> animation) {
    return GestureDetector(
      child: DoubtTile(item),
      onTap: () {
        alert(context, item);
        print("Show alert");
      },
    );
  }

  Future<void> alert(BuildContext context, Doubt doubt) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Location',textAlign: TextAlign.center,),
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
                      height: 150,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(doubt.m)),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      // DO something
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
