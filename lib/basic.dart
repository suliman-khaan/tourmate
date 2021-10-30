import 'package:flutter/material.dart';
import 'package:tourmate1/home.dart';
import 'package:tourmate1/review_full.dart';
import 'package:tourmate1/search_page.dart';

class MainHome extends StatefulWidget {
  final int index;
  const MainHome({Key? key, required this.index}) : super(key: key);
  @override
  _MainHomeState createState() => _MainHomeState(index: this.index);
}

class _MainHomeState extends State<MainHome> {
  int index;
  _MainHomeState({required this.index});
  @override
  Widget build(BuildContext context) {
    int pageIndex = index;
    List pageList = <Widget>[
      home(),
      SearchPage(),
      Review(),
    ];
    return Material(
      child: SafeArea(
          child: Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.language_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_outlined), label: "Review")
          ],
        ),
      )),
    );
  }
}
