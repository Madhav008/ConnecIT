import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  User user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(),
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            RaisedButton(onPressed: (){FirebaseAuth.instance.signOut();},child: Text("SignOut"),),
            Center(child: Text(user.displayName)),
          ],
        ),
      ),
    );
  }
}
