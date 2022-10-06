import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shaur_sec/screens/login/check_user.dart';
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
// mlm
// import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:flutter/material.dart';

// void main() {
// runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
// void _pickFile() async {

// 	// opens storage to pick files and the picked file or files
// 	// are assigned into result and if no file is chosen result is null.
// 	// you can also toggle "allowMultiple" true or false depending on your need
// 	final result = await FilePicker.platform.pickFiles(allowMultiple: true);

// 	// if no file is picked
// 	if (result == null) return;

// 	// we get the file from result object
// 	final file = result.files.first;

// 	_openFile(file.path);
// }

// void _openFile(file) {
// 	OpenFile.open(file.path);
// }

// @override
// Widget build(BuildContext context) {
  
// 	return MaterialApp(
// 	debugShowCheckedModeBanner: false,
// 	home: Scaffold(
// 		backgroundColor: Colors.green[100],
// 		body: Center(
// 		child: MaterialButton(
// 			onPressed: () {
// 			_pickFile();
// 			},
// 			child: Text(
// 			'Pick and open file',
// 			style: TextStyle(color: Colors.white),
// 			),
// 			color: Colors.green,
// 		),
// 		),
// 	),
// 	);
// }
// }




// import 'package:shaur_sec/services/download_file.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: DownloadButton(url: 'https://www.africau.edu/images/default/sample.pdf',),
//       ),
//     );
//   }
// }

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({Key? key, required this.url}) : super(key: key);

//   final String url;

//   Future<void> _downloadFile() async {
//     DownloadService downloadService =
//         kIsWeb ? WebDownloadService() : MobileDownloadService();
//     await downloadService.download(url: url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: _downloadFile,
//       icon: const Icon(Icons.download),
//       label: const Text('Download'),
//     );
//   }
// }









// ignore_for_file: prefer_interpolation_to_compose_strings

// import 'dart:io';
// import 'dart:math';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';

// void main() async {
//   await FlutterDownloader.initialize();
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: ElevatedButton(
//         child: const Text("data"),
//         onPressed: () => _downloadFile(
//             "https://file-examples.com/storage/fe4999944e63361b793404c/2017/10/file_example_JPG_100kB.jpg",
//             "fafdsf"),
//       )),
//     );

//     // Future<String> downloadFile(String url, String fileName) async {
//     //   String dir = await getApplicationDocumentsDirectory().toString();
//     //   HttpClient httpClient = new HttpClient();
//     //   File file;
//     //   String filePath = '';
//     //   String myUrl = '';

//     //   try {
//     //     myUrl = url + '/';
//     //     var request = await httpClient.getUrl(Uri.parse(myUrl));
//     //     var response = await request.close();
//     //     if (response.statusCode == 200) {
//     //       var bytes = await consolidateHttpClientResponseBytes(response);
//     //       filePath = '$dir/$fileName';
//     //       file = File(filePath);
//     //       await file.writeAsBytes(bytes);
//     //       print(filePath);
//     //       print("inoj");
//     //     } else {
//     //       filePath = 'Error code: ' + response.statusCode.toString();
//     //     }
//     //     print("er c :" + response.statusCode.toString());
//     //   } catch (ex) {
//     //     filePath = 'Can not fetch url';
//     //     print("can't fetch url");
//     //   }

//     //   return filePath;
//     // }
//     // static var httpClient = new HttpClient();
//     // Future<File> _downloadFile(String url, String filename) async {
//     //   var request = await httpClient.getUrl(Uri.parse(url));
//     //   var response = await request.close();
//     //   var bytes = await consolidateHttpClientResponseBytes(response);
//     //   String dir = (await getApplicationDocumentsDirectory()).path;
//     //   // if ("$dir/$filename" == "$dir/$filename") {
//     //   //   print("download");
//     //   // }
//     //   // else {

//     //   // }
//     //   File filec = new File('$dir/$filename');

//     //   await filec.writeAsBytes(bytes);
//     //   print(filec);
//     //   // var file
//     //   // final file = filec..first;

//     //   // OpenFile(filec.path);
//     //   final _result = await OpenFile.open(filec.path);
//     //   return filec;
//     // }

// // void _openFile(PlatformFile file) {
// // 	OpenFile.open(file.path);
// // }
//   }

//   // downloadFile() async {
//   //     String dir = (await getApplicationDocumentsDirectory()).path;
//   //     String localPath = (await dir) + Platform.pathSeparator + 'Download';
//   //         final savedDir = Directory(localPath);
//   //         bool hasExisted = await savedDir.exists();
//   //         if (!hasExisted) {
//   //           savedDir.create();
//   //         }
//   //   final taskId = await FlutterDownloader.enqueue(
//   //     url: 'https://file-examples.com/storage/fe4999944e63361b793404c/2017/04/file_example_MP4_480_1_5MG.mp4',
//   //     savedDir: savedDir.path,
//   //     showNotification:
//   //         true, // show download progress in status bar (for Android)
//   //     openFileFromNotification:
//   //         true, // click on notification to open downloaded file (for Android)
//   //   );
//   // }
//   static var httpClient = new HttpClient();
//   Future<File> _downloadFile(String url, String filename) async {
//     var request = await httpClient.getUrl(Uri.parse(url));
//     var response = await request.close();
//     var bytes = await consolidateHttpClientResponseBytes(response);
//     String dir = (await getTemporaryDirectory()).path;
//     File file = new File('$dir/$filename');
//     await file.writeAsBytes(bytes);
//     print(file.uri);
//     await OpenFile.open(file.path);
//     return file;
//   }
// }
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
