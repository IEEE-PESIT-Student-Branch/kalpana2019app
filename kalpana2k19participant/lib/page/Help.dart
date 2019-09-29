// import 'package:flutter/material.dart';
// import 'package:kalpana2k19participant/model/Doubt.dart';
// import 'package:kalpana2k19participant/widget/ScheduleTile.dart';
// class HelpPage extends StatelessWidget {
// //   List<Doubt> doubt = [
// //     Doubt("KAL123", 2, "How to change the background of this laptop.I don't know how to do that. can someone help?"),
// //     Doubt("KAL133", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL153", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //     Doubt("KAL163", 2, "THIS IS MY DOUBT"),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       type: MaterialType.transparency,
// //       child: Container(
// //         decoration: BoxDecoration(
// //             color: Color(0xFFFF)
// //             ),
// //         child: SafeArea(
// //           child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: <Widget>[
// //                 SizedBox(height: 10),
// //                 Center(
// //                   child: Text(
// //                     'Mentor Help',
// //                     style: TextStyle(
// //                       color: Color(0xFF4138B2),
// //                       fontSize: 36,
// //                       fontWeight: FontWeight.w800,
// //                       fontFamily: 'MENTOR HELP',
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 3),
// //                 Expanded(
// //                   child: _buildcol(),
// //                 )
// //               ]
// //               ),
// //         ),
// //       ),
// //     );
// //   }
  
// // Widget _buildcol(){ // this widgit/method returns what is rendered
// //     return ListView.builder( // it returns a list of all the names
// //       padding: const EdgeInsets.all(16.0), //we add a padding of 16px to make it look better
// //       itemBuilder: (BuildContext ctx, int i){
// //         if(i < doubt.length){
// //           return _card(doubt[i]);
// //         }
// //       }
// //     );
// //   }

// // Widget _buildRow(Doubt pair) { // a widget that takes in a WordPair
// //     return ListTile( // return a list
// //       title: Text( 
// //         pair.Title // title of the list is the saved name
// //       ),
// //       trailing: Icon( // add an icon
// //        Icons.thumb_up
// //         // alreadySaved ? Icons.favorite : Icons.favorite_border, // if it is saved then 1 else 2
// //         // color: alreadySaved ? Colors.red: null, // if saved then red else none
// //       ),
// //     );
// //   }

// // Widget _card(Doubt pair){
// //   var m = 0;
// //   m = pair.flagLevel;
// //   return Center(
// //     child: Card(
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: <Widget>[
// //           ListTile(
// //             leading: Icon(Icons.person),
// //             title: Text(pair.Title),
// //             subtitle: Text(pair.value),
// //             contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
// //           ),
          
// //           ButtonTheme.bar( // make buttons use the appropriate styles for cards
// //             child: ButtonBar(
// //               children: <Widget>[
// //                 FlatButton(
// //                   child: const Text('Claim'),
// //                   onPressed: () { /* ... */ },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// //   }
//}