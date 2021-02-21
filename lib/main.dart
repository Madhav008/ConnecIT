import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginDesign/pages/home.dart';
import 'auth/authentication.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return (snapshot.data != null)
                ? SplashScreen(snapshot.data)
                : Login();
          }),
    );
  }
}

class SplashScreen extends StatelessWidget {
  User data;
  SplashScreen(this.data);
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      OneSignal.shared.init("c0069866-c963-42d5-9cda-f05f59b99886");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(data),
          ));
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xff5892F6)),
        child: Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5892F6),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text("Login With Google"),
          onPressed: () async {
            User user = await Auth().signInWithGoogle();

            if (user != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(user),
                  ));
            }
          },
        )),
      ),
    );
  }
}
