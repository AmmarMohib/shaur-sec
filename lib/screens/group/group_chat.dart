import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:shaur_sec/components/chatModel.dart';
import 'package:shaur_sec/components/customs/pdf_view.dart';
import 'package:shaur_sec/components/customs/photo_view.dart';
import 'package:shaur_sec/components/customs/speed_dial.dart';
import 'package:shaur_sec/screens/group/show_file.dart';
import 'package:shaur_sec/screens/uploadFiles/upload_files.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:shaur_sec/services/download_file.dart';

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
  @override
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  final ref = FirebaseStorage.instance.ref().child('testimage');
  final TextEditingController _chatCon = TextEditingController();
  final ScrollController _chatScrollCon = ScrollController();


  @override
  Widget build(BuildContext context) {
 
 
    print(widget.DOCId);
    return MaterialApp(
        home: Scaffold(
  //         floatingActionButton: TextButton(child: Text("fsfd"), onPressed: (() {
  //   // if (_chatScrollCon.hasClients) {
  //   _chatScrollCon.animateTo(
  //   _chatScrollCon.position.maxScrollExtent,
  //   duration: Duration(milliseconds: 1),
  //   curve: Curves.fastOutSlowIn,
  // );     
  //   // }           
  //         })),          
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
                  .orderBy("senttime")
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView(
                      controller: _chatScrollCon,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                                        if (_chatScrollCon.hasClients) {
    _chatScrollCon.animateTo(
    _chatScrollCon.position.maxScrollExtent,
    duration: Duration(milliseconds: 1),
    curve: Curves.decelerate,
   );     
    } 
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        var datac = data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                                    .toString()
                                    .compareTo(
                                        FirebaseAuth.instance.currentUser!.uid) >
                                0
                            ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                FirebaseAuth.instance.currentUser!.uid
                            : FirebaseAuth.instance.currentUser!.uid +
                                "ar0Z7hs8KsVuottCEpVm9WlPrCO2"];
                        var datao = data["uid"] != null
                            ? data["uid"].toString().compareTo(
                                        FirebaseAuth.instance.currentUser!.uid) >
                                    0
                                ? data["uid"] +
                                    FirebaseAuth.instance.currentUser!.uid
                                : FirebaseAuth.instance.currentUser!.uid +
                                    data["uid"]
                            : null;
                        return Container(
                          // color: Col,
                          // height: MediaQuery.of(context).size.height * 0.85,
                          child: Column(
                            children: [
                              //     Row(
                              //       crossAxisAlignment: CrossAxisAlignment.end,
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: <Widget>[
                              //         // (datac != null)

                              //     //  datac != null ? ChatModel(data: data, datatext: data[datac], modelColor: Colors.red):Text("")
                              //     ChatModel(modelColor: Color.fromARGB(255, 104, 156, 170),datatext: datao,data: data,)
                              //   ]
                              // )

                             FirebaseAuth.instance.currentUser!.uid == "ar0Z7hs8KsVuottCEpVm9WlPrCO2" ?
                             Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // SizedBox(height: 100,),
                                  (datac != null)
                                      ? ChatModel(data: data, datatext: datac, modelColor: Color.fromARGB(255, 172, 180, 182))
                                      : datao != null &&
                                              FirebaseAuth
                                                      .instance.currentUser!.uid ==
                                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 5.0),
                                              child: ChatModel(
                                                modelColor: Color.fromARGB(255, 23, 53, 61),
                                                datatext: data[datao],
                                                data: data,
                                              ),
                                            )
                                          : Text(""),
                                          // SizedBox(height: 1000,)
                                ],
                              ):
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  (datac != null)
                                      ? ChatModel(data: data, datatext: datac, modelColor: Color.fromARGB(255, 37, 94, 123))
                                      : datao != null &&
                                              FirebaseAuth
                                                      .instance.currentUser!.uid ==
                                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 8.0),
                                              child: ChatModel(
                                                modelColor: Color.fromARGB(255, 37, 94, 123),
                                                datatext: data[datao],
                                                data: data,
                                              ),
                                            )
                                            
                                          : Text(""),
                                ],
                              ),
                              SizedBox(
                                // height: 100,
                              ),
                              data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"] != null
                                  ? FirebaseAuth.instance.currentUser!.uid == "ar0Z7hs8KsVuottCEpVm9WlPrCO2" ? 
                                  Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          ChatModel(
                                              data: data,
                                              datatext: data[
                                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2"],
                                              modelColor: Color.fromARGB(255, 37, 94, 123))]))
                                  : Padding(
                                     padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          ChatModel(
                                              data: data,
                                              datatext: data[
                                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2"],
                                              modelColor: Color.fromARGB(255, 172, 180, 182))
                                        ],
                                      ),
                                    )
                                  : Text(""),
                              //
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.7,),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // First child is enter comment text input
                  Expanded(
                    child: TextField(
                      controller: _chatCon,
                      onSubmitted: (d) => _sendMessage(),
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
                  SpeedDial(
                    animatedIcon: AnimatedIcons.view_list,
                    animatedIconTheme: const IconThemeData(size: 22.0),
                    // this is ignored if animatedIcon is non null
                    // child: Icon(Icons.add),
                    // visible: _dialVisible,
                    curve: Curves.bounceIn,
                    overlayColor: Colors.black,
                    overlayOpacity: 0,
                    // overlayOpacity: 0.5,
                    onOpen: () => print('OPENING DIAL'),
                    onClose: () => print('DIAL CLOSED'),
                    tooltip: 'attach-file',
                    elevation: 0,
                    // heroTag: 'speed-dial-hero-tag',
                    backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
                    foregroundColor: Colors.black,
                    // elevation: 8.0,
                    shape: const CircleBorder(),
                    children: [
                      SpeedDialChild(
                          child: const Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                          backgroundColor:
                              const Color.fromRGBO(172, 68, 207, 1.0),
                          label: 'Videos',
                          // labelStyle: TextTheme(fontSize: 18.0),
                          onTap: () => uploadFiles(widget.DOCId, "Videos")),
                      SpeedDialChild(
                        child: const Icon(
                          Icons.photo,
                          color: Colors.white,
                        ),
                        backgroundColor: const Color.fromRGBO(2, 3, 111, 1.0),
                        label: 'Images',
                        // labelStyle: TextTheme(fontSize: 18.0),
                        onTap: () => uploadFiles(widget.DOCId, "Images"),
                      ),
                      SpeedDialChild(
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        backgroundColor:
                            const Color.fromRGBO(211, 57, 109, 1.0),
                        label: 'Camera',
                        // labelStyle: const TextTheme(fontSize: 18.0),
                        onTap: () => uploadFiles(widget.DOCId, "Camera"),
                      ),
                      SpeedDialChild(
                        child: const Icon(
                          Icons.file_copy,
                          color: Colors.white,
                        ),
                        backgroundColor: const Color.fromRGBO(81, 87, 174, 1.0),
                        label: 'Documents',
                        // labelStyle: const TextTheme(fontSize: 18.0),
                        onTap: () => uploadFiles(widget.DOCId, "Documents"),
                      ),
                      // SpeedDialChild(
                      //   child: const Icon(Icons.account_circle, color: Colors.white,),
                      //   backgroundColor: const Color.fromRGBO(14, 171, 244, 10.0),
                      //   label: 'contact',
                      //   // labelStyle: TextTheme(fontSize: 18.0),
                      //   onTap: () => print('THIRD CHILD'),
                      // ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    iconSize: 20.0,
                    onPressed: () async {
                      _sendMessage();
                    },
                  ),
                ])),
          ],
        ),
      ),
    ));
  }

  _sendMessage() {
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
    print(DateFormat.jm().format(DateTime.now()));
    if (FirebaseAuth.instance.currentUser!.uid ==
        "ar0Z7hs8KsVuottCEpVm9WlPrCO2") {
      print("this is an admin");
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
      String formattedDate = DateFormat().add_yMMMEd().add_jms().format(now);
      print(formattedDate);
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
        // "sentdate": now.day+now.hour+now.month,
        "senttime": formattedDate
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
      String formattedDate = DateFormat().add_yMMMEd().add_jms().format(now);
      var ref = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection("Admin")
          .doc("Groups")
          .collection("data")
          .doc(widget.DOCId)
          .collection("uids")
          .add({"uid": FirebaseAuth.instance.currentUser!.uid}).then(
              (value) => {
                    // messageId = value.id,
                    print(value.id)
                  });
      FirebaseFirestore.instance
          .collection("Admin")
          .doc("Groups")
          .collection("data")
          .doc(widget.DOCId)
          .collection("messages")
          .add({
        "ar0Z7hs8KsVuottCEpVm9WlPrCO2"
                    .toString()
                    .compareTo(FirebaseAuth.instance.currentUser!.uid) >
                0
            ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                FirebaseAuth.instance.currentUser!.uid
            : FirebaseAuth.instance.currentUser!.uid +
                "ar0Z7hs8KsVuottCEpVm9WlPrCO2": _chatCon.text,
        // "sentOn": currentTime,
        // "sentdate": formatter,
        "senttime": formattedDate, // "id" : messageId,
        "uid": FirebaseAuth.instance.currentUser!.uid
      }).then((value) => {
                // messageId = value.id,
                print(value.id)
              });
      _chatCon.clear();
//                       print(docId);
    }
  }

  Future<void> _downloadFile(url, name) async {
    print('downloading fle');
    DownloadService downloadService =
        kIsWeb ? WebDownloadService() : MobileDownloadService();
    await downloadService.download(url: url, name: name);
  }
}

class DownloadButton extends StatelessWidget {
  final String name;

  const DownloadButton({Key? key, required this.url, required this.name})
      : super(key: key);

  final String url;

  Future<void> _downloadFile() async {
    print('downloading fle');

    DownloadService downloadService =
        kIsWeb ? WebDownloadService() : MobileDownloadService();
    await downloadService.download(url: url, name: name);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _downloadFile,
      icon: const Icon(Icons.download),
      label: const Text('Download'),
    );
  }
}
