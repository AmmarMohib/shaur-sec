import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaur_sec/screens/group/group_chat.dart';
import 'package:shaur_sec/screens/home/homepage.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  var docId;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Admin')
      .doc("Groups")
      .collection("data")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Admin')
        .doc("Groups")
        .collection("data")
        .get()
        .then((QuerySnapshot querySnapshot) {
      // print(doc.id.toString());
      Future.delayed(Duration.zero, () {
        var i = 0;
        // while (i >= querySnapshot.docs.length) {
        //   print(i);
        //   // print(querySnapshot.docs.length);
        // }
      });
    });

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => ListTile(
                  onTap:() {
              print("fdsad");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupChat(
                              dataGet: snapshot.data!.docs[index],
                              DOCId: snapshot.data!.docs[index].id,
                            )));
                  },
                  // itemCount: 1,
                  // shrinkWrap: true,
                  // scrollDirection: Axis.vertical
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.groups,
                      color: Colors.white,
                    ),
                    backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
                  ),
                  title: Text(
                    snapshot.data!.docs[index]['title'],
                    style: TextStyle(color: Colors.black),
                  ),
                  // subtitle: docId != null ? Text(snapshot.data!.docs[snapshot.data!.docs.length].id) : Text(""),
                ),
              ),
            );

            // subtitle: Text(data['company']),
          });
    //   return MaterialApp(
    //     home: Scaffold(
    //       body: TextButton(
    //         onPressed: () {
    //           FirebaseFirestore.instance
    //  .collection('Admin')
    //     .doc("Groups")
    //     .collection("data")
    //   .get()
    //   .then((QuerySnapshot querySnapshot) {
    //       querySnapshot.docs.forEach((doc) {
    //           print(doc["title"]);
    //       });
    //   });
    //         },
    //         child: Text("sdfsfd"),
    //       ),
    //     ),
    //   );
  }
}
