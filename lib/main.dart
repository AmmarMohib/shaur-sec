import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shaur_chat_app/screens/login/check_user.dart';
import 'package:shaur_chat_app/screens/login/signup_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color.fromRGBO(6, 49, 70, 1.0)),
      home: const MyHomePage(title: 'Shaur Educational Complex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CheckUser();
  }
}
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(FlutterContactsExample());

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
//       final contacts = await FlutterContacts.getContacts(withPhoto: true);
//       setState(() => _contacts = contacts);
//     }
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//           home: Scaffold(
//         appBar: AppBar(title: Text('flutter_contacts_example')),
//         // body: (_contacts) == null
//         //     ? Center(child: CircularProgressIndicator())
//         //     : ListView.builder(
//         //         itemCount: _contacts!.length,
//         //         itemBuilder: (BuildContext context, int index) {
//         //           Uint8List? image = _contacts![index].photo;
//         //           String num = _contacts![index].phones.isNotEmpty ? _contacts![index].phones.first.number : '';
//         //           return ListTile(
//         //               leading: (_contacts![index].photo == null)
//         //                   ? const CircleAvatar(child: Icon(Icons.person))
//         //                   : CircleAvatar(
//         //                       backgroundImage: MemoryImage(image!)),
//         //               title: Text("${_contacts![index].displayName} ${num}"),
//         //               // subtitle: Text(num),
//         //               onTap: () {
//         //                 if (_contacts![index].phones.isNotEmpty) {
//         //                   // launch('tel: ${num}');
//         //                 }
//         //               });
//         //         })));
//         body: _body(),
//       ));

//   Widget _body() {
//     if (_permissionDenied) return Center(child: Text('Permission denied'));
//     if (_contacts == null) return Center(child: CircularProgressIndicator());
//     return ListView.builder(
//         itemCount: _contacts!.length,
//         itemBuilder: (context, i) {
//           Uint8List? image = _contacts![i].photo;
//           // Uint8List? image = _contacts![i].photo;

//           // leading: _contacts![i].photo != null
//           // ? Image.memory(_contacts?[i].photo)
//           // : null,
//           return ListTile(
//             leading: (_contacts![i].photo == null)
//                           ? const CircleAvatar(child: Icon(Icons.person))
//                           : CircleAvatar(
//                               backgroundImage: MemoryImage(image!)),
//               title: Text(_contacts![i].displayName),
//               onTap: () async {
//                 final fullContact =
//                     await FlutterContacts.getContact(_contacts![i].id);
//                 await Navigator.of(context).push(MaterialPageRoute(
//                     builder: (_) => ContactPage(fullContact!)));
//               });
//         });
//   }
// }

// class ContactPage extends StatelessWidget {
//   final Contact contact;
//   ContactPage(this.contact);

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: Text(contact.displayName)),
//             body: Column(children: [
//               Text('First name: ${contact.name.first}'),
//               Text('Last name: ${contact.name.last}'),
//               Text(
//                   'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
//               Text(
//                   'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
//             ])),
//       );
// }
