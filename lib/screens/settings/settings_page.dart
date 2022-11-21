import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Settings"),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
SizedBox(height: MediaQuery.of(context).size.height * 0.15,width: MediaQuery.of(context).size.width * 0.2,),

                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.account_circle_rounded, color: Colors.white,size: 95,),
                    radius: 45,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
Column(
  children: [
        FirebaseAuth.instance.currentUser!.phoneNumber == "+923218406295" ? Text("Sir Mohib", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontStyle: FontStyle.italic, color: Colors.grey[700]),): Text(""),
                FirebaseAuth.instance.currentUser!.phoneNumber == "+923218406295" ? Text("You are an admin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontStyle: FontStyle.italic, color: Colors.grey[700]),): Text(""),

  ],
),
                ],
              ),
Divider(height: 6,color: Colors.grey[500],)


              // TextButton(onPressed: () {}, child: Text("dsfs", style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
