import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:codelab09_flutter_kamera/widget/takepicture_screen.dart';
// import 'package:codelab09_flutter_kamera/widget/filter_carousel.dart';

Future<void> main() async {
  // Pastikan Flutter binding aktif sebelum panggil kamera
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar semua kamera di device
  final cameras = await availableCameras();

  // // Pilih kamera pertama sebagai default (biasanya belakang)
  // final firstCamera = cameras.first;

  // Jalankan aplikasi
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        cameras: cameras,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
  
  // runApp(
  //   MaterialApp(
  //     home: PhotoFilterCarousel(camera: firstCamera),
  //     debugShowCheckedModeBanner: false,
  //   ),
  // );

}
