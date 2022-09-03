import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:shaur_chat_app/components/customs/speed_dial.dart';

class GroupChat extends StatefulWidget {
  final dataGet;
  final DOCId;

  const GroupChat({
    super.key,
    this.dataGet = const [],
    this.DOCId,
  });

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  TextEditingController _chatCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.DOCId);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ListTile(
            leading: const CircleAvatar(
              child: Icon(
                Icons.groups,
                color: Colors.white,
              ),
              backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
            ),
            title: Text(
              widget.dataGet['title'],
              style: const TextStyle(color: Color.fromRGBO(6, 49, 70, 1.0)),
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
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Groups")
                  .collection("data")
                  .doc(widget.DOCId)
                  .collection("messages")
                  .snapshots(includeMetadataChanges: true),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('No messages in group');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return Flexible(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              (data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                                                  .toString()
                                                  .compareTo(FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid) >
                                              0
                                          ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                          : FirebaseAuth
                                                  .instance.currentUser!.uid +
                                              "ar0Z7hs8KsVuottCEpVm9WlPrCO2"] !=
                                      null)
                                  ? InkWell(
                                      onLongPress: () {
                                        this.activate();
                                        print("long pressed");
                                        // CAB();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade200,
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Row(
                                            children: <Widget>[
                                              (data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                                                                  .toString()
                                                                  .compareTo(FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid) >
                                                              0
                                                          ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                          : FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid +
                                                              "ar0Z7hs8KsVuottCEpVm9WlPrCO2"] !=
                                                      null)
                                                  ? Expanded(
                                                      child: Text(
                                                        "${data["ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(FirebaseAuth.instance.currentUser!.uid) > 0 ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" + FirebaseAuth.instance.currentUser!.uid : FirebaseAuth.instance.currentUser!.uid + "ar0Z7hs8KsVuottCEpVm9WlPrCO2"]}",
                                                        maxLines: null,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    )
                                                  : const Text(''),
                                              (data[FirebaseAuth.instance
                                                          .currentUser!.uid] !=
                                                      null)
                                                  ? const Text(
                                                      "",
                                                      // data['sentOn'],
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    )
                                                  : const Text(""),
                                              data != null
                                                  ? Text(
                                                      data["senttime"]
                                                          .toString(),
                                                      // data['sentOn'],
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    )
                                                  : const Text("")
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // (data[widget.uid] != null)
                                // ?
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Column(
                                      children: [
                                        // Text(widget.name),
                                        Row(
                                          children: [
                                            Container(
                                              width: 300,
                                              child: data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"] != null ? Text(
                                                data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"] ??
                                                    "",
                                                maxLines: null,
                                                overflow: TextOverflow.visible,
                                              ): null,
                                            ),
                                            // (data[widget.uid] != null)
                                            // ?
                                            const Text(
                                              "",

                                              // "${data[widget.uid]} ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            // : Container(),
                                            // (data[widget.uid!] != null)
                                            // ?
                                            data != null
                                                ? Text(
                                                    data["senttime"].toString(),
                                                    // data['sentOn'],
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                : const Text(""),
                                            // : Container()
                                            TextButton(onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomSpeedDial()));
                                            }, child: Text("data"))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                // : Container(),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // First child is enter comment text input
                  Expanded(
                    child: TextFormField(
                      controller: _chatCon,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: "Some Text",
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                        fillColor: Colors.blue,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent)),
                      ),
                    ),
                  ),
                  // Second child is button
                  IconButton(
                    icon: const Icon(Icons.send),
                    iconSize: 20.0,
                    onPressed: () async {
//                       print(chatController.text);
                      DateTime now = DateTime.now();
                      print(now.hour.toString() +
                          ":" +
                          now.minute.toString() +
                          ":" +
                          now.second.toString());
                      print(now.day);
                      print(now.month);
                      print(now.year);
                      if (FirebaseAuth.instance.currentUser!.uid ==
                          "ar0Z7hs8KsVuottCEpVm9WlPrCO2") {
                        print("this is an admin");
                        FirebaseFirestore.instance.settings = const Settings(
                          persistenceEnabled: true,
                          cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
                        );
                        var ref = FirebaseAuth.instance.currentUser!.uid;
                        FirebaseFirestore.instance
                            .collection("Admin")
                            .doc("Groups")
                            .collection("data")
                            .doc(widget.DOCId)
                            .collection("messages")
                            .add({
                          "ar0Z7hs8KsVuottCEpVm9WlPrCO2": _chatCon.text,
                          // "sentOn": currentTime,
                          // "sentdate": formatter,
                          "senttime": DateFormat.jm().format(DateTime.now())
                          // "id" : messageId,
                        }).then((value) => {
                                  // messageId = value.id,
                                  print(value.id)
                                });
                        _chatCon.clear();
//                       print(docId);
                      } else {
                        print("no admin");
                        FirebaseFirestore.instance.settings = const Settings(
                          persistenceEnabled: true,
                          cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
                        );
                        var ref = FirebaseAuth.instance.currentUser!.uid;
                        FirebaseFirestore.instance
                            .collection("Admin")
                            .doc("Groups")
                            .collection("data")
                            .doc(widget.DOCId)
                            .collection("messages")
                            .add({
                          "ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(
                                      FirebaseAuth.instance.currentUser!.uid) >
                                  0
                              ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                  FirebaseAuth.instance.currentUser!.uid
                              : FirebaseAuth.instance.currentUser!.uid +
                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2": _chatCon.text,
                          // "sentOn": currentTime,
                          // "sentdate": formatter,
                          "senttime": DateFormat.jm().format(DateTime.now())
                          // "id" : messageId,
                        }).then((value) => {
                                  // messageId = value.id,
                                  print(value.id)
                                });
                        _chatCon.clear();
//                       print(docId);
                      }
                    },
                  )
                ])),
          ],
        ),
      ),
    ));
  }
}
