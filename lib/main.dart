import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shaur_sec/screens/login/check_user.dart';
import 'package:shaur_sec/screens/login/signup_screen.dart';
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

// import 'package:flutter/foundation.dart' show kIsWeb; // for checking whether running on Web or not
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:pdf_render/pdf_render_widgets.dart';

// void main(List<String> args) => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final controller = PdfViewerController();
//   TapDownDetails? _doubleTapDetails;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: ValueListenableBuilder<Matrix4>(
//               // The controller is compatible with ValueListenable<Matrix4> and you can receive notifications on scrolling and zooming of the view.
//               valueListenable: controller,
//               builder: (context, _, child) =>
//                   Text(controller.isReady ? 'Page #${controller.currentPageNumber}' : 'Page -')),
//         ),
//         backgroundColor: Colors.grey,
//         body: GestureDetector(
//           // Supporting double-tap gesture on the viewer.
//           onDoubleTapDown: (details) => _doubleTapDetails = details,
//           onDoubleTap: () => controller.ready?.setZoomRatio(
//             zoomRatio: controller.zoomRatio * 1.5,
//             center: _doubleTapDetails!.localPosition,
//           ),
//           child: !kIsWeb && Platform.isMacOS
//               // Networking sample using flutter_cache_manager
//               ? PdfViewer.openFutureFile(
//                   // Accepting function that returns Future<String> of PDF file path
//                   () async => (await DefaultCacheManager().getSingleFile(
//                           'https://github.com/espresso3389/flutter_pdf_render/raw/master/example/assets/hello.pdf'))
//                       .path,
//                   viewerController: controller,
//                   onError: (err) => print(err),
//                   params: const PdfViewerParams(
//                     padding: 10,
//                     minScale: 1.0,
//                     // scrollDirection: Axis.horizontal,
//                   ),
//                 )
//               : Text("data")
//                 ),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FloatingActionButton(
//               child: const Icon(Icons.first_page),
//               onPressed: () => controller.ready?.goToPage(pageNumber: 1),
//             ),
//             FloatingActionButton(
//               child: const Icon(Icons.last_page),
//               onPressed: () => controller.ready?.goToPage(pageNumber: controller.pageCount),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String pathPDF = "";
//   String landscapePathPdf = "";
//   String remotePDFpath = "";
//   String corruptedPathPDF = "";

//   @override
//   initState() async {
//     super.initState();
//     // fromAsset('assets/corrupted.pdf', 'corrupted.pdf').then((f) {
//     //   setState(() {
//     //     corruptedPathPDF = f.path;
//     //   });
//     // });
//     // fromAsset('assets/demo-link.pdf', 'demo.pdf').then((f) {
//     //   setState(() {
//     //     pathPDF = f.path;
//     //   });
//     // });
//     // fromAsset('assets/demo-landscape.pdf', 'landscape.pdf').then((f) {
//     //   setState(() {
//     //     landscapePathPdf = f.path;
//     //   });
//     // });

//    await createFileOfPdfUrl().then((f) {
//       setState(() {
//         remotePDFpath = f.path;
//       });
//     });
//   }

//   Future<File> createFileOfPdfUrl() async {
//     Completer<File> completer = Completer();
//     print("Start download file from internet!");
//     try {
//       // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
//       final url = "https://pdfkit.org/docs/guide.pdf";
//       // const url = "https://firebasestorage.googleapis.com/v0/b/shaur-chat.appspot.com/o/docs%2F3425?alt=media&token=18c51f73-0741-409a-a0df-d7cafb4becde";
//       final filename = url.substring(url.lastIndexOf("/") + 1);
//       var request = await HttpClient().getUrl(Uri.parse(url));
//       var response = await request.close();
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       var dir = await getApplicationDocumentsDirectory();
//       print("Download files");
//       print("${dir.path}/$filename");
//       File file = File("${dir.path}/$filename");

//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   Future<File> fromAsset(String asset, String filename) async {
//     // To open from assets, you can copy them to the app storage folder, and the access them "locally"
//     Completer<File> completer = Completer();

//     try {
//       var dir = await getApplicationDocumentsDirectory();
//       File file = File("${dir.path}/$filename");
//       var data = await rootBundle.load(asset);
//       var bytes = data.buffer.asUint8List();
//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter PDF View',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Plugin example app')),
//         body: Center(child: Builder(
//           builder: (BuildContext context) {
//             return Column(
//               children: <Widget>[
//                 TextButton(
//                   child: Text("Remote PDF"),
//                   onPressed: () {
//                     if (remotePDFpath.isNotEmpty) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFScreen(path: remotePDFpath),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         )),
//       ),
//     );
//   }
// }

// class PDFScreen extends StatefulWidget {
//   final String? path;

//   PDFScreen({Key? key, this.path}) : super(key: key);

//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   final Completer<PDFViewController> _controller =
//       Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Document"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           PDFView(
//             filePath: widget.path,
//             enableSwipe: true,
//             swipeHorizontal: true,
//             autoSpacing: false,
//             pageFling: true,
//             pageSnap: true,
//             defaultPage: currentPage!,
//             fitPolicy: FitPolicy.BOTH,
//             preventLinkNavigation:
//                 false, // if set to true the link is handled in flutter
//             onRender: (_pages) {
//               setState(() {
//                 pages = _pages;
//                 isReady = true;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$page: ${error.toString()}';
//               });
//               print('$page: ${error.toString()}');
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               _controller.complete(pdfViewController);
//             },
//             onLinkHandler: (String? uri) {
//               print('goto uri: $uri');
//             },
//             onPageChanged: (int? page, int? total) {
//               print('page change: $page/$total');
//               setState(() {
//                 currentPage = page;
//               });
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container()
//               : Center(
//                   child: Text(errorMessage),
//                 )
//         ],
//       ),
//       floatingActionButton: FutureBuilder<PDFViewController>(
//         future: _controller.future,
//         builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//           if (snapshot.hasData) {
//             return FloatingActionButton.extended(
//               label: Text("Go to ${pages! ~/ 2}"),
//               onPressed: () async {
//                 await snapshot.data!.setPage(pages! ~/ 2);
//               },
//             );
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }