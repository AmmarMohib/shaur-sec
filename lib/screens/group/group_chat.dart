import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupChat extends StatefulWidget {
  final dataGet;
  const GroupChat({
    super.key,
    this.dataGet = const [],
  });

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Row(
          //   children: [
          //     Icon(Icons.groups),
          //     Text(widget.dataGet['title'].toString().toUpperCase()),
          //   ],
          // ),
          elevation: 0,
          title: ListTile(
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
                widget.dataGet['title'],
                style: TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
              )),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromRGBO(6, 49, 70, 1.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: widget.dataGet['Contact'][0]['contacts'].length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(widget.dataGet['Contact'][0]['contacts'][index]['displayName'].toString()), subtitle: Text(FirebaseAuth.instance.currentUser?.uid.toString() ?? ''),);
          },
        ),
      ),
    );
  }
}
