import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
//         body: Column(
//           children: [
//             // ListView.builder(
//             //   itemCount: widget.dataGet['Contact'][0]['contacts'].length,
//             //   itemBuilder: (BuildContext context, int index) {
//             //     return ListTile(title: Text(widget.dataGet['Contact'][0]['contacts'][index]['displayName'].toString()), subtitle: Text(FirebaseAuth.instance.currentUser?.uid.toString() ?? ''),);

//             //   },
//             // ),
//                 Expanded(
//                     child: TextFormField(
//                       // controller: chatController,
//                       autocorrect: false,
//                       decoration: new InputDecoration(
//                         labelText: "Some Text",
//                         labelStyle:
//                             TextStyle(fontSize: 20.0, color: Colors.white),
//                         fillColor: Colors.blue,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.purpleAccent)),
//                       ),
//                     ),
//                   ),
//                   // Second child is button
//                   IconButton(
//                     icon: Icon(Icons.send),
//                     iconSize: 20.0,
//                     onPressed: () async {
// //                       print(chatController.text);
// //                       // DateTime now = DateTime.now();
// // // print(now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString());
// //                       FirebaseFirestore.instance.settings = const Settings(
// //                         persistenceEnabled: true,
// //                         cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
// //                       );

// //                       DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
// //                       final now = new DateTime.now();
// //                       String formatter =
// //                           DateFormat('yMd').format(now); // 28/03/2020
// //                       print(formatter);
// //                       print(dateFormat);
// //                       dynamic currentTime =
// //                           DateFormat.jm().format(DateTime.now());
// //                       e = currentTime;
// //                       var ref = FirebaseAuth.instance.currentUser!.uid;
// //                       FirebaseFirestore.instance
// //                           .collection("Chats")
// //                           .doc(docId)
// //                           .collection("messages")
// //                           .add({
// //                         "$ref": chatController.text,
// //                         "sentOn": currentTime,
// //                         "sentdate": formatter,
// //                         "id" : messageId,
// //                       }).then((value) => {
// //                                 messageId = value.id,
// //                               });
// //                       await FirebaseFirestore.instance
// //                           .collection("Chats")
// //                           .doc("users")
// //                           .collection(FirebaseAuth.instance.currentUser!.uid)
// //                           .get()
// //                           .then((snapshot) {
// //                         var data = snapshot.docs.map((e) => e.get('uid'));
// //                         // print(snapshot.docs.length == 0);
// //                         print(data);
// //                         // ignore: unrelated_type_equality_checks
// //                         if (data.length == 0) {
// //                           print("No collection");
// //                           FirebaseFirestore.instance
// //                               .collection("Chats")
// //                               .doc("users")
// //                               .collection(
// //                                   FirebaseAuth.instance.currentUser!.uid)
// //                               .add({
// //                             "uid": widget.uid,
// //                             "name": widget.name,
// //                             "avatar": widget.avatar
// //                           });
// //                         }
// //                       });
// //                       // FirebaseApi.postMessage(chatController.text, );
// //                       // FirebaseApi(docId, FirebaseAuth.instance.currentUser!.uid, chatController.text);
// //                       await FirebaseFirestore.instance
// //                           .collection("Chats")
// //                           .doc("users")
// //                           .collection(widget.uid)
// //                           .get()
// //                           .then((snapshot) {
// //                         // print(snapshot.docs.length == 0);
// //                         var data = snapshot.docs.map((e) => e.get('uid'));
// //                         // ignore: unrelated_type_equality_checks
// //                         if (data.length == 0) {
// //                           FirebaseFirestore.instance
// //                               .collection("usersInfo")
// //                               .doc(FirebaseAuth.instance.currentUser!.uid)
// //                               .get()
// //                               .then((snapshot) {
// //                             print("No collection");
// //                             var name = snapshot.get('name');
// //                             var userimg = snapshot.get('user-img');
// //                             FirebaseFirestore.instance
// //                                 .collection("Chats")
// //                                 .doc("users")
// //                                 .collection(widget.uid)
// //                                 .add({
// //                               "uid": FirebaseAuth.instance.currentUser!.uid,
// //                               "name": name,
// //                               "avatar": userimg
// //                             });
// //                           });
// //                         }
// //                       });

//                       // chatController.clear();
//                       // print(docId);
//                     },
//                   )
//           ]
//         ),
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
                  return Text('No messages in group');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                (data[ "ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(
                                    FirebaseAuth.instance.currentUser!.uid) >
                                0
                            ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                FirebaseAuth.instance.currentUser!.uid
                            : FirebaseAuth.instance.currentUser!.uid +
                                "ar0Z7hs8KsVuottCEpVm9WlPrCO2"] !=
                                        null)
                                    ? InkWell(
                                        onLongPress: () {
                                          this.activate();
                                          print("long pressed");
                                          // CAB();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade200,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Row(
                                              children: [
                                                (data["ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(
                                    FirebaseAuth.instance.currentUser!.uid) >
                                0
                            ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                FirebaseAuth.instance.currentUser!.uid
                            : FirebaseAuth.instance.currentUser!.uid +
                                "ar0Z7hs8KsVuottCEpVm9WlPrCO2"] !=
                                                        null)
                                                    ? Text(
                                                        "${data["ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(
                                    FirebaseAuth.instance.currentUser!.uid) >
                                0
                            ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                FirebaseAuth.instance.currentUser!.uid
                            : FirebaseAuth.instance.currentUser!.uid +
                                "ar0Z7hs8KsVuottCEpVm9WlPrCO2"]}",
                                                        maxLines: null,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      )
                                                    : Text(
                                                        "fggggggggggggggggggg",
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                (data[FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid] !=
                                                        null)
                                                    ? Text(
                                                        "",
                                                        // data['sentOn'],
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      )
                                                    : Text("")
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // (data[widget.uid] != null)
                                // ?
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
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
                                              child: Text(
                                                data.toString(),
                                                maxLines: null,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                            // (data[widget.uid] != null)
                                            // ?
                                            Text(
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
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                : Text("")
                                            // : Container()
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
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // First child is enter comment text input
                  Expanded(
                    child: TextFormField(
                      controller: _chatCon,
                      autocorrect: false,
                      decoration: new InputDecoration(
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
                    icon: Icon(Icons.send),
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
                      FirebaseFirestore.instance.settings = const Settings(
                        persistenceEnabled: true,
                        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
                      );

                      // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
//                       final now = new DateTime.now();
//                       String formatter =
//                           DateFormat('yMd').format(now); // 28/03/2020
//                       print(formatter);
//                       print(dateFormat);
//                       dynamic currentTime =
//                           DateFormat.jm().format(DateTime.now());
//                       e = currentTime;
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
                        "senttime": now.millisecond
                        // "id" : messageId,
                      }).then((value) => {
                                // messageId = value.id,
                                print(value.id)
                              });
                      //   await FirebaseFirestore.instance
                      //       .collection("Chats")
                      //       .doc("users")
                      //       .collection(FirebaseAuth.instance.currentUser!.uid)
                      //       .get()
                      //       .then((snapshot) {
                      //     var data = snapshot.docs.map((e) => e.get('uid'));
                      //     // print(snapshot.docs.length == 0);
                      //     print(data);
                      //     // ignore: unrelated_type_equality_checks
                      //     if (data.length == 0) {
                      //       print("No collection");
                      //       FirebaseFirestore.instance
                      //           .collection("Chats")
                      //           .doc("users")
                      //           .collection(
                      //               FirebaseAuth.instance.currentUser!.uid)
                      //           .add({
                      //         "uid": widget.uid,
                      //         "name": widget.name,
                      //         "avatar": widget.avatar
                      //       });
                      //     }
                      //   });
//                       // FirebaseApi.postMessage(chatController.text, );
//                       // FirebaseApi(docId, FirebaseAuth.instance.currentUser!.uid, chatController.text);
//                       await FirebaseFirestore.instance
//                           .collection("Chats")
//                           .doc("users")
//                           .collection(widget.uid)
//                           .get()
//                           .then((snapshot) {
//                         // print(snapshot.docs.length == 0);
//                         var data = snapshot.docs.map((e) => e.get('uid'));
//                         // ignore: unrelated_type_equality_checks
//                         if (data.length == 0) {
//                           FirebaseFirestore.instance
//                               .collection("usersInfo")
//                               .doc(FirebaseAuth.instance.currentUser!.uid)
//                               .get()
//                               .then((snapshot) {
//                             print("No collection");
//                             var name = snapshot.get('name');
//                             var userimg = snapshot.get('user-img');
//                             FirebaseFirestore.instance
//                                 .collection("Chats")
//                                 .doc("users")
//                                 .collection(widget.uid)
//                                 .add({
//                               "uid": FirebaseAuth.instance.currentUser!.uid,
//                               "name": name,
//                               "avatar": userimg
//                             });
//                           });
//                         }
//                       });

                      _chatCon.clear();
//                       print(docId);
                    },
                  )
                ])),
          ],
        ),
      ),
    ));
  }
}
