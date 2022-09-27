// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shaur_sec/screens/login/check_user.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primaryColor: Color.fromRGBO(6, 49, 70, 1.0)),
//       home: const MyHomePage(title: 'Shaur Educational Complex'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const CheckUser();
//   }
// }
// mlm
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
void _pickFile() async {

	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(allowMultiple: true);

	// if no file is picked
	if (result == null) return;

	// we get the file from result object
	final file = result.files.first;

	_openFile(file);
}  

void _openFile(PlatformFile file) {
	OpenFile.open(file.path);
}

@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: Scaffold(
		backgroundColor: Colors.green[100],
		body: Center(
		child: MaterialButton(
			onPressed: () {
			_pickFile();
			},
			child: Text(
			'Pick and open file',
			style: TextStyle(color: Colors.white),
			),
			color: Colors.green,
		),
		),
	),
	);
}
}
// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Reading and Writing Files',
//       home: FlutterDemo(storage: CounterStorage()),
//     ),
//   );
// }

// class CounterStorage {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     print(directory);
//     return directory.path;
//   }

//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/counter.txt');
//   }

//   Future<int> readCounter() async {
//     try {
//       final file = await _localFile;
//       print(file.path);

//       // Read the file
//       final contents = await file.readAsString();

//       return int.parse(contents);
//     } catch (e) {
//       // If encountering an error, return 0
//       return 0;
//     }
//   }

//   Future<File> writeCounter(int counter) async {
//     final file = await _localFile;

//     // Write the file
//     return file.writeAsString('$counter');
//   }
// }

// class FlutterDemo extends StatefulWidget {
//   const FlutterDemo({super.key, required this.storage});

//   final CounterStorage storage;

//   @override
//   State<FlutterDemo> createState() => _FlutterDemoState();
// }

// class _FlutterDemoState extends State<FlutterDemo> {
//   int _counter = 0;

//   @override
//   void initState() {
//     super.initState();
//     widget.storage.readCounter().then((value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

//   Future<File> _incrementCounter() {
//     setState(() {
//       _counter++;
//     });

//     // Write the variable as a string to the file.
//     return widget.storage.writeCounter(_counter);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reading and Writing Files'),
//       ),
//       body: Center(
//         child: Text(
//           'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
