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