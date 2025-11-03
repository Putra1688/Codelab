import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Rangga`s Location')),
  //     body: Center(child: Text(myPosition)),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final myWidget = myPosition == ''
  //       ? const CircularProgressIndicator() // Widget ini bisa const karena tidak menerima variabel
  //       : Text(myPosition); // Hapus const di sini!

  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Rangga\'s location')),
  //     body: Center(child: myWidget),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rangga\'s location')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
              // } else if (snapshot.connectionState == ConnectionState.done) {
              //   return Text(snapshot.data.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Hentikan di sini kalau GPS mati
      throw Exception('Location services are disabled');
    }
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high, // Opsi tambahan
    );
    return position;
  }
}
