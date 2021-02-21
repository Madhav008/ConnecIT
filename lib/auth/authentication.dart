import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginDesign/auth/firestore.dart';
import 'package:loginDesign/models/user.dart';

class Auth {
  FireStoreServices _firestoreService = FireStoreServices();

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final User user = authResult.user;

    var existingUser = await _firestoreService.fetchUser(user.uid);

    var userData = Users(
        userId: user.uid,
        name: user.displayName,
        username: user.displayName,
        email: user.email,
        isAdmin: false,
        image: user.photoURL);
        
    if (existingUser == null) {
      await _firestoreService.addUser(userData);
    }
    return user;
  }
}
