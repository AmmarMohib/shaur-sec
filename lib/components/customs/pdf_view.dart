// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class PDFScreen extends StatefulWidget {
//   final String? fileName;
//   final String? path;

//   PDFScreen({Key? key, this.path, this.fileName}) : super(key: key);

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
//         title: Text(widget.fileName.toString()),
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

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class PdfViewer extends StatefulWidget {
  final String URl;
  final String fileName;

  const PdfViewer({super.key, required this.URl, required this.fileName});

  @override
  _pdfViewState createState() => _pdfViewState();
}

class _pdfViewState extends State<PdfViewer> {
  // final sampleUrl = '${widget.URl.toLowerCase()}';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${widget.fileName}');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(widget.URl.toString()));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
  }

  @override
  Widget build(BuildContext context) {
    loadPdf();
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Plugin example app'),
          ),
          body: pdfFlePath != null ? Center(
            child: Column(
              children: <Widget>[
                  Expanded(
                    child: Container(
                      child: PdfView(path: pdfFlePath!),
                    ),
                  )
              ],
            ),
          ):CircularProgressIndicator(),
        );
      }),
    );
  }
}
