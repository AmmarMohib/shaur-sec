import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Color.fromRGBO(6, 49, 70, 1.0),),
          ),
          title: Text(
            "Admin Page",
            style: TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                const Text(
                  "Welcome Admin, now you can add \n Groups, Chats and edit features",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(6, 49, 70, 1.0), fontSize: 17, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
