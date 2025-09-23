import 'dart:async';
import 'package:flutter/material.dart';

class MyDatePickers extends StatefulWidget {
  const MyDatePickers({super.key, required this.title});

  final String title;

  @override
  State<MyDatePickers> createState() => _MyDatePickers();
}

class _MyDatePickers extends State<MyDatePickers> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Initial SelectDate FLutter
  Future<void> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  // Widget ini HANYA mengembalikan Column yang berisi
  // teks tanggal dan sebuah tombol.
  return Column(
    mainAxisSize: MainAxisSize.min, // Agar ukurannya pas dengan isinya
    children: <Widget>[
      Text("${selectedDate.toLocal()}".split(' ')[0]),
      const SizedBox(
        height: 8.0, // Beri sedikit jarak
      ),
      ElevatedButton(
        onPressed: () {
          _selectDate(context);
        },
        child: const Text('Pilih Tanggal'),
      ),
    ],
  );
}
}