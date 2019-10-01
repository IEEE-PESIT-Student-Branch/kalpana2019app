import 'package:flutter/material.dart';
import 'package:kalpana2k19participant/mentor/page/doubt.dart';
import 'package:kalpana2k19participant/mentor/page/pined.dart';


class HomePage extends StatefulWidget {
  @override
  _HomeNavPageState createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageoptions = [
    DoubtPage(),
    PinnedPage(),
  ];
  PageController _controller = PageController(
    initialPage: 1,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pageoptions[_selectedPage],
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (i) {
          setState(() {
            _selectedPage = i;
          });
        },
        children: _pageoptions,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF4138B2)),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _controller.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Doubt'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fiber_pin),
              title: Text('Pinned'),
            ),
            
          ],
        ),
      ),
    );
  }
}