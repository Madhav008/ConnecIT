import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  var user;
  Timeline(this.user);
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text('Search'));
  }
}
