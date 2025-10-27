import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:codelab09_flutter_kamera/widget/displaypicture_screen.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakePictureScreen({super.key, required this.cameras});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  // Tambahan
  late CameraDescription _activeCamera;

  @override
  void initState() {
    super.initState();
    _activeCamera = widget.cameras.first; // default: kamera belakang
    _initializeCamera(_activeCamera);
  }

  void _initializeCamera(CameraDescription cameraDescription) {
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720248')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'switchCamera',
            onPressed: () async {
              final lensDirection = _activeCamera.lensDirection;
              final newCamera = widget.cameras.firstWhere(
                (cam) => cam.lensDirection != lensDirection,
                orElse: () => widget.cameras.first,
              );

              setState(() {
                _activeCamera = newCamera;
                _initializeCamera(_activeCamera);
              });
            },
            child: const Icon(Icons.cameraswitch),
          ),
          FloatingActionButton(
            heroTag: 'takePicture',
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();

                if (!context.mounted) return;

                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DisplayPictureScreen(imagePath: image.path),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
