import 'package:flutter/material.dart';
import 'dart:io';
import 'package:codelab09_flutter_kamera/widget/filter_carousel.dart';

// A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({super.key, required this.imagePath});

//   @override
//   State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture - 2341720248')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
  });

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2341720248')),
      body: _showFilter
          ? PhotoFilterCarousel(imagePath: widget.imagePath)
          : Image.file(File(widget.imagePath)),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFilter = !_showFilter;
          });
        },
        child: Icon(_showFilter ? Icons.close : Icons.filter_alt),
      ),
    );
  }
}

