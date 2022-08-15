import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:shaur_chat_app/screens/contacts/contacts.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
          title: Text("New Group"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Text(
                "Members:",
                style: TextStyle(
                    color: Color.fromRGBO(6, 49, 70, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Contacts()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("add Members"),
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(6, 49, 70, 1.0))),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
