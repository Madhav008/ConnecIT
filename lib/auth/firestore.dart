import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginDesign/models/user.dart';

class FireStoreServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> addUser(Users user) {
    return _db.collection('user').doc(user.userId).set(user.toMap());
  }

  Future<Users> updateUser(Users user){
    return _db.collection('user').doc(user.userId).update(user.toMap());
  }
  Future<Users> fetchUser(String userId) {
    return _db
        .collection('user')
        .doc(userId)
        .get()
        .then((value) => Users.fromFirestore(value.data()));
  }


  
}
