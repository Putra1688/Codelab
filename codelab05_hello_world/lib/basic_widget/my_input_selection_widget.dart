import 'package:flutter/material.dart';

class MyInputSelection extends StatelessWidget {
  const MyInputSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nama',
        ),
      ),
    );
    
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(title: const Text("Contoh TextField")),
    //     body: const TextField(
    //       obscureText: false,
    //       decoration: InputDecoration(
    //         border: OutlineInputBorder(),
    //         labelText: 'Nama',
    //       ),
    //     ),
    //   ),
    // );
  }
}