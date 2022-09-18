import 'package:flutter/material.dart';
import 'package:shaur_sec/screens/group/create_group.dart';
import 'package:shaur_sec/screens/home/homepage.dart';

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
          leading: IconButton(
            onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromRGBO(6, 49, 70, 1.0),
            ),
          ),
          title: Text(
            "Admin Page",
            style: TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding:
                        EdgeInsets.all(30),
                    child: Center(
                      child: AlertDialog(
                        elevation: 0,
                        title: Center(
                            child: Text(
                          "Choose a category",
                          style:
                              TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
                        )),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateGroup()));
                                  },
                                  child: Text(
                                    "Create Group",
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(6, 49, 70, 1.0))),
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add Contact",
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(6, 49, 70, 1.0))),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Close"))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Welcome Admin, now you can add \n Groups, Chats and edit features",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(6, 49, 70, 1.0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
