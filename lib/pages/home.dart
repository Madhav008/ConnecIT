import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginDesign/pages/activity_feed.dart';
import 'package:loginDesign/pages/profile.dart';
import 'package:loginDesign/pages/search.dart';
import 'package:loginDesign/pages/timeline.dart';
import 'package:loginDesign/widgets/circular_nocted_upward.dart';
import 'package:loginDesign/widgets/custom_bootombar.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;
  Widget currentPage;
  List _screen;
  Timeline time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = Timeline(widget.user);
    _screen = [ActivityFeed(),Search(),time,Profile()];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          bottomNavigationBar: FABBottomAppBar(
            centerItemText: ' ',
            color: Colors.green,
            backgroundColor: Color(0xffF5F5F5),
            selectedColor: Colors.red,
            notchedShape: CircularOuterNotchedRectangle(),
            onTabSelected: (value) {
              currentPage = _screen[value];
              setState(() {
                
              });
            },
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: ' '),
              FABBottomAppBarItem(iconData: Icons.search, text: ' '),
              FABBottomAppBarItem(iconData: Icons.account_circle, text: ' '),
              FABBottomAppBarItem(iconData: Icons.more_horiz, text: ' '),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  child:
                      Container(height: 30, width: 30, child: Icon(Icons.add)),
                  elevation: 2.0,
                ),
              ),
            ),
          ),
          body: currentPage),
    );
  }
}
