import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaur_chat_app/screens/group/group_chat.dart';
import 'package:shaur_chat_app/screens/home/homepage.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Admin')
      .doc("Groups")
      .collection("data")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GroupChat(dataGet: data,)));
              },
              child: ListTile(
                  // itemCount: 1,
                  // shrinkWrap: true,
                  // scrollDirection: Axis.vertical
                  leading: CircleAvatar(child: Icon(Icons.groups, color: Colors.white,), backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),),
                  title: Text(
                    data['title'],
                    style: TextStyle(color: Colors.black),
                  )),
            );
            // subtitle: Text(data['company']),
          }).toList(),
        );
      },
    );
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