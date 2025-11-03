import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranggga Dwi Saputra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePage();
}

// class ini berfungsi untuk menampilkan halaman utama aplikasi
class _FuturePage extends State<FuturePage> {
  String result = '';
  late Completer completer;

  // method ini berfungsi untuk mendapatkan angka secara asynchronous
  Future getNumber() {
    completer = Completer<int>();
    // calculate();
    calculate2();
    return completer.future;
  }

  // untuk melakukan perhitungan secara asynchronous
  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }

  // melakukan perhitungan secara asynchronous dengan penanganan error
  Future calculate2() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      throw Exception('Simulated error'); // ini memicu error
      // completer.complete(42);  jika ini dinonaktifkan, maka akan memicu error oleh catch
    } catch (e) {
      completer.completeError(e);
    }
  }

  //  mengambil data dari API secara asynchronous
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/jJAhBwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  // mengembalikan angka 1 secara asynchronous setelah menunggu 3 detik
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  // mengembalikan angka 2 secara asynchronous setelah menunggu 3 detik
  Future<int> returnTwosync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  // mengembalikan angka 3 secara asynchronous setelah menunggu 3 detik
  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  // menghitung total dari tiga angka yang dikembalikan secara asynchronous
  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwosync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                // ------------------
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });
                setState(() {
                  result = 'An error occurred';
                });

                // count();
                // ------------------
                // setState(() {});
                // getData()
                //     .then((value) {
                //       result = value.body.toString().substring(0, 450);
                //       setState(() {});
                //     })
                //     .catchError((_) {
                //       result = 'An error occurred';
                //       setState(() {});
                //     });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
