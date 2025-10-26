import 'package:flutter/material.dart';
import 'filter_selector.dart';
import 'package:camera/camera.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  final CameraDescription camera;
  const PhotoFilterCarousel({
    Key? key,
    required this.camera, // tambahkan ini
  }) : super(key: key);

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(child: _buildPhotoWithFilter()),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Inisialisasi kamera depan misalnya
    _cameraController = CameraController(
      widget.camera, // kamera dikirim dari main()
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Widget _buildPhotoWithFilter() {
    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Preview kamera dengan filter
          return ValueListenableBuilder(
            valueListenable: _filterColor,
            builder: (context, color, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(_cameraController), // preview live kamera
                  Container(
                    color: color.withOpacity(
                      0.3,
                    ), // filter warna semi-transparan
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(onFilterChanged: _onFilterChanged, filters: _filters);
  }
}
