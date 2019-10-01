import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:kalpana2k19participant/database.dart';
import 'package:kalpana2k19participant/model/Doubt.dart';
import 'package:kalpana2k19participant/widget/doubtTile.dart';

class DoubtPage extends StatefulWidget {
  @override
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  Database database;
  final _message = TextEditingController();
  List<Doubt> doubtlist = [];
  DatabaseReference helpRef;
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    database = new Database();
    database.initState();
    helpRef = database.gethelpRef();
    helpRef.onChildAdded.listen(_onDataAdded);
    helpRef.onChildChanged.listen(_onDataChanged);
    helpRef.onChildRemoved.listen(_onDataRemoved);
    database.teamid = '2000';
  }

  _onDataRemoved(Event event) {
    var old =doubtlist.singleWhere((entry){
      return entry.key == event.snapshot.key; // event.snapshot.value['i'] == database.teamid;
    });
    int index = doubtlist.indexOf(old);
    // setState(() {
    //   doubtlist.removeWhere((entry) {
    //     return entry.key == event.snapshot.key;
    Doubt removedItem=doubtlist.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(context,removedItem, animation);
};
    _listkey.currentState.removeItem(index, builder);
    //   });
    // });
  }

  _onDataAdded(Event event) {
    if (event.snapshot.value['i'] == database.teamid) {
      Doubt item = Doubt.formSnapshot(event.snapshot);
      print(item.m);
      doubtlist.insert(0, item);
      _listkey.currentState.insertItem(0);
      // setState(() {
      //   doubtlist.add(Doubt.formSnapshot(event.snapshot));
      // });
    }
  }

  _onDataChanged(Event event) {
    var old = doubtlist.singleWhere((entry) {
      return entry.key == event.snapshot.key &&
          event.snapshot.value['i'] == database.teamid;
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF8418B7),
          Color(0xFF450289),
        ])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 62,
            ),
            Text(
              'Ask the Mentor',
              style: TextStyle(
                fontFamily: 'kau',
                color: Colors.white,
                fontSize: 38,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: TextField(
                controller: _message,
                decoration: InputDecoration(
                  hintText: "Need help...",
                  border: InputBorder.none,
                ),
                maxLines: 8,
                maxLength: 75,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(55, 17, 55, 17),
              child: Text("Ask Question!"),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () async {
                load(context);
                await database.postdoubt(
                    context, new Doubt(_message.text, 0, database.teamid));
                _message.text = '';
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        onPressed: () => _viewposts(context),
      ),
    );
  }

  void _viewposts(BuildContext ctx) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: ctx,
        builder: (BuildContext buildContext) {
          return AnimatedList(
            key: _listkey,
            initialItemCount: doubtlist.length,
            itemBuilder: (context, index, animation) => _buildItem(context,doubtlist[index], animation),
          );
        }
    );
  }
        
  Widget _buildItem(BuildContext context, Doubt item, Animation<double> animation) {
    return Doubtcard(item);
  }
}

Future<void> load(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
            type: MaterialType.transparency,
            child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ));
      });
}
