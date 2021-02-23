import 'package:flutter/material.dart';
import 'package:loginDesign/widgets/header.dart';
import 'package:loginDesign/widgets/progress.dart';

class Timeline extends StatefulWidget {
  var user;
  Timeline(this.user);
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context,isAppTitle: true),
      body: linearProgress() ,
    );
  }
}
