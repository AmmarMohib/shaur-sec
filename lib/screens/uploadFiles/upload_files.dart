import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

// class UploadFiles extends StatefulWidget {
//   const UploadFiles({super.key});

//   @override
//   State<UploadFiles> createState() => _UploadFilesState();
// }

// class _UploadFilesState extends State<UploadFiles> {

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

// }
uploadFiles(docId) async {
  // FilePickerResult? result = await FilePicker.platform.pickFiles(
  //   type: FileType.custom,
  //   allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg'],
  // );
  // String? outputFile = await FilePicker.platform.saveFile(
  //   dialogTitle: 'Please select an output file:',
  //   fileName: 'output-file.pdf',
  // );

  // if (outputFile == null) {
  //   // User canceled the picker
  // }
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(allowedExtensions: ['pdf', 'doc'], type: FileType.custom);

  if (result != null) {
    PlatformFile file = result.files.first;

    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);
    Random _ranStg = Random();
    final String imgPath = 'docs/${_ranStg.nextInt(10000)}';
    final FirebaseStorage storage = FirebaseStorage.instance;

    TaskSnapshot tasking = await storage.ref(imgPath).putFile(File(file.path!));
    String url = await storage.ref(imgPath).getDownloadURL();
    print('url1 => $url');
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
                            .doc(docId)
                            .collection("messages")
                            .add({
                          "ar0Z7hs8KsVuottCEpVm9WlPrCO2": url,
                          // "sentOn": currentTime,
                          // "sentdate": formatter,
                          "senttime": DateFormat.jm().format(DateTime.now()),
                          "name" : file.name
                          // "id" : messageId,
                        }).then((value) => {
                                  // messageId = value.id,
                                  print(value.id)
                                });
                        // _chatCon.clear();
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
                            .doc(docId)
                            .collection("messages")
                            .add({
                          "ar0Z7hs8KsVuottCEpVm9WlPrCO2".toString().compareTo(
                                      FirebaseAuth.instance.currentUser!.uid) >
                                  0
                              ? "ar0Z7hs8KsVuottCEpVm9WlPrCO2" +
                                  FirebaseAuth.instance.currentUser!.uid
                              : FirebaseAuth.instance.currentUser!.uid +
                                  "ar0Z7hs8KsVuottCEpVm9WlPrCO2": url,
                          // "sentOn": currentTime,
                          // "sentdate": formatter,
                          "senttime": DateFormat.jm().format(DateTime.now()),
                          "name" : file.name
                          // "id" : messageId,
                        }).then((value) => {
                                  // messageId = value.id,
                                  print(value.id)
                                });
                        // _chatCon.clear();
//                       print(docId);
                      }
    // setState(() {
    // _url = url;
    // });;
  } else {
    // User canceled the picker
  }
}
