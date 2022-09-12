// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ShowFile extends StatefulWidget {
//   const ShowFile({super.key});

//   @override
//   State<ShowFile> createState() => _ShowFileState();
// }

// class _ShowFileState extends State<ShowFile> {
//   @override
//     void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       WebView.platform = SurfaceAndroidWebView();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           // actions: const [Align(
//           //   alignment: Alignment.bottomRight,
//           // child: Icon(
//           //   Icons.close,
//           //   color: Colors.black,
//           //   ))],
//           leading: IconButton(
//             icon: const Icon(
//               Icons.close,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.of(context);
//             },
//           ),
//           elevation: 0,
//         ),
//         body: const WebView(
//           initialUrl: 'https://help.olx.com.pk/hc/en-us',
//         ),
//       ),
//     );
//     ;
//   }
// }