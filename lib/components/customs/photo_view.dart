import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatefulWidget {
  final String imgUrl;
  const PhotoViewer({super.key, required this.imgUrl});

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded), onPressed: (() {
          Navigator.pop(context);
        }),
      ),
                  backgroundColor: const Color.fromRGBO(6, 49, 70, 1),

      ),
      body: PhotoView(
        imageProvider: NetworkImage(widget.imgUrl),
      ),
    );
  }
}
