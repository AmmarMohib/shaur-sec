// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:shaur_sec/screens/Admin/admin.dart';
import 'package:shaur_sec/screens/contacts/contacts.dart';
import 'package:shaur_sec/screens/home/homepage.dart';

class CreateGroup extends StatefulWidget {
  final List? conList;
  const CreateGroup({super.key, this.conList = const []});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class FirestoreApi {
  static Future uploadContacts(List contacts, title) async {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    // final Map<String, dynamic> map = json.decode(contacts.toString());
    final contactsJson =
        await contacts.map((contact) => contact.toJson()).toList();
    //doesnt exist
    print("object");
    var refUser = FirebaseFirestore.instance
        .collection('Admin')
        .doc("Groups")
        .collection("data");
    List con = [
      {"contacts": contactsJson}
    ];
    var UsersPhones = FirebaseFirestore.instance.collection('UsersPhones');
    for (var i = 0; i < contacts.length; i++) {
      UsersPhones.add({"num": contacts[i].phones.first.number});
    }
    // print(arr[i]);uuuuuuut8
    // var rng = Random();
    for (var i = 0; i < 10; i++) {
      // print(rng.nextInt(10))]
      print(i);
    }
    await refUser.add({
      // 'username': 'alex',
      'Contact': con,
      'title': title,
    });
    // }
  }
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController _titleController = TextEditingController();
  var tmpArray = [];
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    // print(widget.conList);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Admin()));
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
          title: Text("New Group"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _createGroup,
          child: Icon(Icons.done),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contacts()));
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
            ),
            ListView.builder(
              itemCount: widget.conList?.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(
                      widget.conList![index].displayName ?? '',
                    ));
              },
              // subtitle: Text(data['company']),
            ),
            Divider(color: Color.fromRGBO(6, 49, 70, 1.0)),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    "Title:",
                    style: TextStyle(
                        color: Color.fromRGBO(6, 49, 70, 1.0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(6, 49, 70, 1.0)),
                        ),
                        labelText: 'Enter Group Name',
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(6, 49, 70, 1.0)),
                        ),
                      ),

                      // obscureText: obscure,
                      onFieldSubmitted: ((value) => {
                            // if (_PassController.text == "secShaur")
                            //   {
                            //     print("succesful"),
                            //         Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => Admin()))
                            //     }
                            // else
                            //   {print("wrong Password")}
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _createGroup() async {
    // await refUser.add({
    //       // 'username': 'alex',
    //       'contacts': contactsJson,
    //     });
    FirestoreApi.uploadContacts(widget.conList ?? [], _titleController.text);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage())
    );
  }
}
