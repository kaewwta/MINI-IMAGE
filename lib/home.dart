import 'package:flitter/pages/profile.dart';
import 'package:flitter/pages/search.dart';
import 'package:flitter/pages/tweets.dart';
import 'package:flitter/utils/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    TweetsPage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "ฟีด",
                  style: mystyle(20),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "ค้นหา",
                  style: mystyle(20),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 32,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "โปรไฟล์",
                  style: mystyle(20),
                ))
          ]),
    );
  }
}
