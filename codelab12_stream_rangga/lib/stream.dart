import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.grey,
    Colors.black87,
  ];

  Stream<Color> getColorStream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}
