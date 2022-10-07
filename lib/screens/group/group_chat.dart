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
                                            data['ar0Z7hs8KsVuottCEpVm9WlPrCO2'] !=
                                                    null
                                                ? data['type'] == "document" ||
                                                        data["type"] ==
                                                                "video" &&
                                                            validator.url(data[
                                                                'ar0Z7hs8KsVuottCEpVm9WlPrCO2'])
                                                    ? InkWell(
                                                        onTap: () async {
                                                          // if (await canLaunchUrl(
                                                          //  Uri.parse( data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']))) {
                                                          //   await launchUrl(Uri.parse(data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']), mode: LaunchMode.externalApplication);
                                                          // } else {
                                                          //   throw 'Could not launch ${data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']}';
                                                          // }
                                                          if (data['type'] ==
                                                                  "document" ||
                                                              data['type'] ==
                                                                  "video") {
                                                            print("object");
                                                            _downloadFile(
                                                                data[
                                                                    'ar0Z7hs8KsVuottCEpVm9WlPrCO2'],
                                                                data['name']);
                                                          }
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 PdfViewer(
                                                          //                   fileName:
                                                          //                       data['name'],
                                                          //                   URl:
                                                          //                       data['ar0Z7hs8KsVuottCEpVm9WlPrCO2'],
                                                          //                 )));
                                                        },
                                                        child: SizedBox(
                                                          width: 100,
                                                          child: Text(
                                                            data['name'],
                                                            overflow:
                                                                TextOverflow
                                                                    .visible,
                                                          ),
                                                        ),
                                                      )
                                                    : data["type"] == "image"
                                                        ? InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                          PhotoViewer(imgUrl: data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"],)),
                                                              );
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 120.0,
                                                                  width: 150.0,
                                                                  child: Image(
                                                                      image: NetworkImage(data !=
                                                                              null
                                                                          ? data[
                                                                              'ar0Z7hs8KsVuottCEpVm9WlPrCO2']
                                                                          : null)),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            width: 300,
                                                            child:
                                                                data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"] !=
                                                                        null
                                                                    ? Text(
                                                                        data["ar0Z7hs8KsVuottCEpVm9WlPrCO2"] ??
                                                                            "",
                                                                        maxLines:
                                                                            null,
                                                                        overflow:
                                                                            TextOverflow.visible,
                                                                      )
                                                                    : null,
                                                          )
                                                : Text(""),
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
                  ),
                ])),
          ],
        ),
      ),
    ));
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
