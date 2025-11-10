import 'package:flutter/material.dart';
import 'dart:async';

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

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumbertoSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // addError(){
  //   controller.sink.addError("This is an error");
  // }
}
