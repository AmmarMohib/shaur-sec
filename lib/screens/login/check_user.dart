import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shaur_sec/screens/home/homepage.dart';
import 'package:shaur_sec/screens/login/signup_screen.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    var ch = FirebaseAuth.instance.currentUser;
    // ignore: unnecessary_null_comparison
    if (ch?.uid != null) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      });
    }
    return Container();
  }
}
