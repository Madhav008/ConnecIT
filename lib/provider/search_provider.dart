import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginDesign/models/user.dart';

class SearchUser with ChangeNotifier {
  List<Users> _searchUsers = [];

  List<Users> get searchUser => _searchUsers;

  void resetStreams() {
    _searchUsers = List<Users>();
    _searchUsers.length = 0;
  }

  getUsers(String query) async {
    print(query);
    QuerySnapshot userData = await FirebaseFirestore.instance
        .collection('user')
        .where("username", isGreaterThanOrEqualTo: query)
        .get();
    print(userData.docs.length);

    userData.docs.forEach((user) {
      //convert it from json
      final resultUser = Users.fromFirestore(user.data());
      print(resultUser);

      _searchUsers.add(resultUser);

      print(_searchUsers[0].name);
    });

    notifyListeners();
  }
}
