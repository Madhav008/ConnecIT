import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginDesign/pages/activity_feed.dart';
import 'package:loginDesign/pages/profile.dart';
import 'package:loginDesign/pages/search.dart';
import 'package:loginDesign/pages/timeline.dart';
import 'package:loginDesign/pages/upload.dart';
import 'package:loginDesign/widgets/circular_nocted_upward.dart';
import 'package:loginDesign/widgets/custom_bootombar.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  onTap(int index) {
    
      pageController.animateToPage(index,
      duration: Duration(microseconds: 500),
      curve: Curves.easeInOut
      );
      
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            Timeline(widget.user),
            ActivityFeed(),
            Search(),
            Profile(),
            Upload(),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                onPressed: () {
                  pageController.jumpToPage(5);
                },
                child: Container(height: 30, width: 30, child: Icon(Icons.photo_camera)),
                elevation: 2.0,
              ),
            ),
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: ' ',
          color: Theme.of(context).accentColor,
          backgroundColor: Color(0xffF5F5F5),
          selectedColor: Theme.of(context).primaryColor,
          notchedShape: CircularOuterNotchedRectangle(),
          onTabSelected: onTap,
          items: [
            FABBottomAppBarItem(iconData: Icons.whatshot, text: ' '),
            FABBottomAppBarItem(iconData: Icons.notifications_active, text: ' '),
            FABBottomAppBarItem(iconData: Icons.search, text: ' '),
            FABBottomAppBarItem(iconData: Icons.account_circle , text: ' '),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
//             backgroundColor: Color(0xffF5F5F5),

//
// ),
