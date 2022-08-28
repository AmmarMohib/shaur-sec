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
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.account_circle, color: Colors.white,size: 100,),
                  radius: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}