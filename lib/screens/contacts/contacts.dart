// // import 'dart:typed_data';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_contacts/flutter_contacts.dart';
// // import 'package:flutterfire_ui/auth.dart';
// // import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:shaur_chat_app/screens/contacts/checklist.dart';
// // // Import package
// // // import 'package:contacts_service/contacts_service.dart';

// class FlutterContactsExample extends StatefulWidget {
//   @override
//   _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
// }

// class _FlutterContactsExampleState extends State<FlutterContactsExample> {
//   bool _permissionDenied = false;
//   // bool _value = false;
//   var isSelected = true;
//   Color? color = Colors.white;
//   List multipleSelected = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts();
//   }

// // Name
//   List<Contact> _contacts = [];
//   List peoples = [];
//   var len;

// // Contact avatar/thumbnail
//   // late Uint8List avatar;

//   Future _fetchContacts() async {
//     if (!await FlutterContacts.requestPermission(readonly: true)) {
//       setState(() => _permissionDenied = true);
//     } else {
//       final contacts = await FlutterContacts.getContacts(withThumbnail: false);
//       setState(() => _contacts = contacts);
//     }
//     // List<Contact>? _contacts;
//     // Get all contacts on device
// // List<Contact> contacts = await ContactsService.getContacts();

// // Get all contacts without thumbnail (faster)
//     // List<Contact> contacts = await ContactsService.getContacts();
//     // setState(() {
//     //   // _contacts = contacts;
//     //   // avatar = contacts[_contacts.length].avatar!;
//     // });

// // Android only: Get thumbnail for an avatar afterwards (only necessary if `withThumbnails: false` is used)

// // Get contacts matching a string
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color.fromRGBO(6, 49, 70, 1.0),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined)),
//       ),
// //       body: _contacts != null
// //           ? List.generate(
// //               _contacts!.length,

// //                 // Uint8List? image = _contacts![i].photo;

// //                 // leading: _contacts![i].photo != null
// //                 // ? Image.memory(_contacts?[i].photo)
// //                 // : null,
// //                  (i) {
// //                 Uint8List? image = _contacts?[i].photo;
// //                    CheckboxListTile(
// //                   //  selected: false,
// //                   // tileColor: isSelected==true ? Colors.red : null,
// //                   // tileColor: isSelected == null ? Colors.red : null,
// //                   // tileColor: color,
// //                   secondary: (_contacts?[i].photo == null)
// //                       ? const CircleAvatar(child: Icon(Icons.person))
// //                       : CircleAvatar(backgroundImage: MemoryImage(image!)),
// //                   title: (_contacts?[i].name != null)
// //                       ? Text(
// //                           _contacts![i].displayName,
// //                         )
// //                       : const Text("no user d name"),
// //                   onChanged: (bool? value) {
// //                     setState(() {
// //                     _value = value!;
// //                     });
// //                   },
// //                   selected: _value,
// //                   value: _value,

// //                   //                 onTap: () async {
// //                   //                   setState(() {
// //                   //                if (isSelected) {
// //                   //   color = Colors.white;
// //                   //   isSelected = false;
// //                   // } else {
// //                   //   color = Colors.red;
// //                   //   isSelected = true;
// //                   // }

// //                   //                   });

// //                   //                   // final fullContact =
// //                   //                   //     await FlutterContacts.getContact(_contacts![i].id);
// //                   //                   // await Navigator.of(context).push(MaterialPageRoute(
// //                   //                   //     builder: (_) => ContactPage(fullContact!)));
// //                   //                 }),
// //                 );
// //               })
// //           : const Text("no contacts yet"),
// //     ));
// //   }
// // //     void toggleSelection(i) {
// // //     setState(() {
// // //       if (isSelected) {
// // //         color = Colors.white;
// // //         isSelected = false;
// // //       } else {
// // //         color = Colors.red;
// // //         isSelected = true;
// // //       }
// // //     });
// // //     print(_contacts?.map((e) => e.displayName));
// // // }
// // }

// // class ContactPage extends StatelessWidget {
// //   final Contact contact;
// //   ContactPage(this.contact);

// //   @override
// //   Widget build(BuildContext context) => MaterialApp(
// //         home: Scaffold(
// //             appBar: AppBar(title: Text(contact.displayName)),
// //             body: Column(children: [
// //               Text('First name: ${contact.name.first}'),
// //               Text('Last name: ${contact.name.last}'),
// //               Text(
// //                   'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
// //               Text(
// //                   'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
//       // ])
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _contacts == null
//                 ? CircularProgressIndicator()
//                 : Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24.0, vertical: 64.0),
//                     child: Column(
//                       children: [
//                         Column(
//                           children: List.generate(_contacts.length, (index) {
//                             setState(() {
//                               len = _contacts;
//                             });
//                             // var image = _contacts[index].avatar.;
//                             Contact contact = _contacts.elementAt(index);
//                             print(contact.photo);
//                             return contact != null
//                                 ? CheckboxListTile(
//                                     // controlAffinity: ListTileControlAffinity.leading,
//                                     contentPadding: EdgeInsets.zero,
//                                     dense: true,
//                                     secondary: const CircleAvatar(
//                                         child: Icon(Icons.person)),
//                                     title: Text(
//                                       _contacts[index].displayName.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 16.0,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     value: checkListItems[index]["value"],
//                                     onChanged: (value) {
//                                       setState(() {
//                                         checkListItems[index]["value"] = value;
//                                         if (multipleSelected
//                                             .contains(checkListItems[index])) {
//                                           multipleSelected
//                                               .remove(checkListItems[index]);
//                                         } else {
//                                           multipleSelected
//                                               .add(checkListItems[index]);
//                                         }
//                                       });
//                                     })
//                                 : Text("no contacts yet");
//                           }),
//                         ),
//                         const SizedBox(height: 64.0),
//                       ],
//                     ),
//                   ),
//             // ElevatedButton(onPressed: () {}, child: Text("Create Group"), )
//             SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) =>
//                     //             // CreateGroup()));
//                     addCon;
//                   },
//                   child: Text(
//                     "Add Them",
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Color.fromRGBO(6, 49, 70, 1.0))),
//                 )),
//           ],
//         ),
//       ),
//     ));
//   }

//   addCon() {
//     // print(peoples[peoples.length]);
//     // if(valuer)
//     // var foo = checkListItems;
//     checkListItems.forEach((key) {
//       if (key == true) {
//         print(key);
//       }
//     });
//     // var val = checkListItems.where((c) => c["value"] == true).length;
//     // if (val!= null) {
//     //   print(_contacts[val-1].id);
//     // }
//     // print(checkListItems);
//   }
// }

// // ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, await_only_futures, unused_import

// // import 'dart:developer';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:contacts_service/contacts_service.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';

// // class Contacts extends StatefulWidget {
// //   const Contacts({Key? key}) : super(key: key);

// //   @override
// //   State<Contacts> createState() => _ContactsState();
// // }

// // class _ContactsState extends State<Contacts> {
// //   List<Contact>? Allcontacts;
// //   List<Contact>? chPhones;
// //   var fireUserUID;
// //   var fireUserData;
// //   List<Item> phones = [];
// //   var firephonenum;
// //   @override
// //   void initState() {
// //     super.initState();
// //     abc();
// //   }

// //   Widget build(BuildContext context) {
// //     // ));
// //     final Stream<QuerySnapshot> _usersStream =
// //         FirebaseFirestore.instance.collection('numbers&avatars').snapshots();
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _usersStream,
// //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //         if (snapshot.hasError) {
// //           return Text('Something went wrong');
// //         }

// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Text("Loading");
// //         }

// //         return ListView(
// //           children: snapshot.data!.docs.map((DocumentSnapshot document) {
// //             Map<String, dynamic> data =
// //                 document.data()! as Map<String, dynamic>;
// //             return ListTile(
// //                 onTap: () => contactpopup(
// //                     data['Uid'], data['avatar'], data['name'], data['num']),
// //                 leading: data != null
// //                     ? ClipOval(
// //                         child: CircleAvatar(
// //                         backgroundImage: NetworkImage(data['avatar']),
// //                       ))
// //                     : CircleAvatar(
// //                         maxRadius: 60,
// //                         child: Icon(
// //                           Icons.account_circle_rounded,
// //                           size: 128,
// //                         ),
// //                         // backgroundColor: Colors.transparent,
// //                       ),
// //                 title: Text(data['name']));
// //           }).toList(),
// //         );
// //       },
// //     );
// //   }

// //   abc() async {
// //     List<Contact> contacts =
// //         await ContactsService.getContacts(withThumbnails: false);
// //     await FirebaseFirestore.instance
// //         .collection("numbers&avatars")
// //         .get()
// //         .then((QuerySnapshot querySnapshot) {
// //       querySnapshot.docs.forEach((doc) {
// //         print(doc.get('num').toString().length);
// //         // print("id" + doc.id);
// //       });
// //     });

// //     List<Contact> johns =
// //         await ContactsService.getContactsForPhone(firephonenum.toString());

// //     //     if(contacts != null){
// //     //   var fcontact = int.parse(contacts.toString());
// //     //   setState(() {
// //     //     Allcontacts = fcontact.toString() as List<Contact>;
// //     //   });
// //     // }
// //     setState(() {
// //       Allcontacts = contacts;
// //       chPhones = johns;
// //     });
// //     var a = contacts.map((e) => e.displayName);
// //     var b = contacts;
// //     if (a != null) {
// //       print(a);
// //     } else {
// //       print(b);
// //     }
// //     // Get all contacts without thumbnail (faster)
// //     print(johns.map((e) => e.phones!.first.value));
// //     var ag = await firephonenum;
// //     print("the data : " + await ag.toString().characters.toString());
// //   }

// //   Future contactpopup(String string, data, name, num) {
// //     return showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //               content: Stack(
// //             clipBehavior: Clip.antiAlias,
// //             children: <Widget>[
// //               TextButton(
// //                   onPressed: () => firepush(string, data, name, num),
// //                   child: Text(
// //                     "chat with contact",
// //                     style: TextStyle(color: Colors.black),
// //                   )),
// //             ],
// //           ));
// //         });
// //   }

// //   firepush(string, data, name, num) {
// //     print(string);
// //     print(FirebaseAuth.instance.currentUser!.phoneNumber);
// //     print(string);
// //     // Navigator.push(
// //     //     context,
// //     //     MaterialPageRoute(
// //     //         builder: (context) => ChattingPage(
// //     //               uid: string.toString(),
// //     //               avatar: data,
// //     //               name: name,
// //     //               num: num,
// //     //             )));
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:shaur_sec/screens/contacts/checklist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shaur_sec/screens/group/create_group.dart';

class FirestoreApi {
  static Future uploadContacts(List<Contact> contacts) async {
    final contactsJson = contacts.map((contact) => contact.toJson()).toList();
    Object? docu;
    var data;
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        docu = doc.data();
        data = doc;
        print(docu);
      });
    });
    if (docu == null) {
      //doesnt exist
      print("dn't exist");
      var refUser = FirebaseFirestore.instance.collection('users');
      await refUser.add({
        // 'username': 'alex',
        'contacts': contactsJson,
      });
    } else if (docu != null) {
      await data.reference.delete();
      print("object");
      var refUser = FirebaseFirestore.instance.collection('users');
      await refUser.add({
        // 'username': 'alex',
        'contacts': contactsJson,
      });
    }
    // if (refUser) {
    //   print("object");
    // } else {
    //   print("no object");
    // }
  }
}

class Contacts extends StatefulWidget {
  
  const Contacts({Key? key}) : super(key: key);
  @override
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
  @override
  void dispose() {
    super.dispose();
  }
  List multipleSelected = [];
  List<Contact>? selectedcon = [];
  List<Contact>? contacts;
  String? con;
  var i;
  @override
  void initState() {
    super.initState();
    getContact();
  }

  void getContact() async {
  //   if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: false, withThumbnail: false);
      print(contacts);
      setState(() {});
    }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Add Contacts",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color.fromRGBO(6, 49, 70, 1.0),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(

          onPressed: pushcontacts,
          child: Icon(Icons.done),
        ),
        body: (contacts) == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  i = index;
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty)
                      ? (contacts![index].phones.first.number)
                      : "--";
                  return CheckboxListTile(
                    secondary: (contacts![index].photo == null)
                        ? const CircleAvatar(child: Icon(Icons.person))
                        : CircleAvatar(backgroundImage: MemoryImage(image!)),
                    title: Text(
                        "${contacts![index].name.first} ${contacts![index].name.last}"),
                    subtitle: Text(num),
                    // onTap: () {
                    //   if (contacts![index].phones.isNotEmpty) {
                    //     // launch('tel: ${num}');
                    //   }
                    // },
                    value: checkListItems[index]["value"],
                    onChanged: (bool? value) {
                      setState(() {
                        checkListItems[index]["value"] = value;
                        if (multipleSelected.contains(checkListItems[index])) {
                          multipleSelected.remove(checkListItems[index]);
                          selectedcon?.remove(contacts![index]);
                        } else {
                          multipleSelected.add(checkListItems[index]);
                          selectedcon?.add(contacts![index]);
                        }
                        con = contacts![index].name.first;
                        print(con);
                      });
                    },
                  );
                },
              ));
  }

  pushcontacts() async {
    // var db = FirebaseFirestore.instance;
    // await db.collection("ex").add({"phones" : selectedcon})
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CreateGroup(conList: selectedcon,)));
    // await FirestoreApi.uploadContacts(selectedcon!);
    checkListItems.forEach((element) {
      element["value"] = false;
    });
    
    print(i);
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';

// class FlutterContactsExample extends StatefulWidget {
//   @override
//   _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
// }

// class _FlutterContactsExampleState extends State<FlutterContactsExample> {
//   List<Contact>? _contacts;
//   bool _permissionDenied = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts();
//   }

//   Future _fetchContacts() async {
//     if (!await FlutterContacts.requestPermission(readonly: true)) {
//       setState(() => _permissionDenied = true);
//     } else {
//       final contacts = await FlutterContacts.getContacts();
//       setState(() => _contacts = contacts);
//     }
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: Text('flutter_contacts_example')),
//           body: _body()));

//   Widget _body() {
//     if (_permissionDenied) return Center(child: Text('Permission denied'));
//     if (_contacts == null) return Center(child: CircularProgressIndicator());
//     return ListView.builder(
//         itemCount: _contacts!.length,
//         itemBuilder: (context, i) => ListTile(
//             title: Text(_contacts![i].displayName),
//             onTap: () async {
//               final fullContact =
//                   await FlutterContacts.getContact(_contacts![i].id);
//               await Navigator.of(context).push(
//                   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
//             }));
//   }
// }

// class ContactPage extends StatelessWidget {
//   final Contact contact;
//   ContactPage(this.contact);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(title: Text(contact.displayName)),
//       body: Column(children: [
//         Text('First name: ${contact.name.first}'),
//         Text('Last name: ${contact.name.last}'),
//         Text(
//             'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
//         Text(
//             'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
//       ]));
// }