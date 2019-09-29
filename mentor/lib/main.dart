import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_example/model/popup.dart';
// import 'package:firebase_core/firebase_core.dart'; not nessecary

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentor',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Item> items = List();
  Item item;
  DatabaseReference itemRef;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "", 0);
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
    // itemRef.onChildRemoved.listen(_onDelete);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  static _onDelete(Item item, int index, DatabaseReference itemRef) {
    itemRef.child(item.key).remove().then((_) {
      print("Delete successful");
      items.removeAt(index);
      print(items.length);
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  static void handleUpdate(Item item, String what, DatabaseReference itemRef) {
    if (item != null) {
      if (what == "solved") {
        itemRef.child(item.key).remove();
      } else {
        item.flag = 1 + item.flag;
        itemRef.child(item.key).set(item.toJson());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Mentor'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => item.title = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: '',
                        onSaved: (val) => item.body = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        handleSubmit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return card(item, index, context, itemRef);
              },
            ),
          ),
        ],
      ),
    );
  }

  static final card = (Item item, int index, BuildContext context,
          DatabaseReference itemRef) =>
      new Center(
          child: Card(
            color: Colors.deepPurple,
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Doubt",
                        description: items[index].body,
                        buttonText: "Okay",
                      ),
                    );
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: ListTile(
                            // leading: Icon(
                            //   Icons.person,
                            //   color: Colors.white,
                            //   size: 100.0,
                            // ),
                            title: Text(
                              items[index].title,
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("SH1 | ROW-2", style:TextStyle(fontSize: 20.0)),
                          ),
                        ),
                        ButtonTheme.bar(
                            // make buttons use the appropriate styles for cards
                            child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('CLAIM', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                handleUpdate(items[index], "unsolved", itemRef);
                              },
                            ),
                            FlatButton(
                              child: const Text('SOLVED', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                _onDelete(items[index], index, itemRef);
                                handleUpdate(items[index], "solved", itemRef);
                              },
                            ),
                          ],
                        ))
                      ]))));
}

class Item {
  String key;
  String title;
  int flag = 0;
  String body;

  Item(this.title, this.body, this.flag);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        body = snapshot.value["body"],
        flag = snapshot.value["flag"];

  toJson() {
    return {
      "title": title,
      "flag": flag,
      "body": body,
    };
  }
}
