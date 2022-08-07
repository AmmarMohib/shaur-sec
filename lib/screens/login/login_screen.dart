import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shaur_chat_app/screens/home/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
            Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
    return Center(
      child: PhoneInputScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              Icons.phone,
              color: Colors.blue,
              size: constraints.maxWidth / 4 * (1 - shrinkOffset),
            ),
          );
        },
      ),
    );
  }
}
