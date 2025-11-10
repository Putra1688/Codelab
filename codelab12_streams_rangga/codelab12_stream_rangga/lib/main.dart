import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streamnya Rangga',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.deepOrange;
  late ColorStream colorStream;
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer transformer;
  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  String values = '';

  // METHODES ===========================================
  void changeColor() async {
    // await for (var eventColor in colorStream.getColorStream()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }
    colorStream.getColorStream().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    int myNum = Random().nextInt(100);
    numberStream.addNumbertoSink(myNum);
    // numberStreamController.addError();
    if (!numberStreamController.isClosed) {
      numberStream.addNumbertoSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    numberStreamController.close();
  }

  // OVERRIDES ===========================================
  @override
  void initState() {
    // colorStream = ColorStream();
    // changeColor();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();
    // Stream stream = numberStreamController.stream;
    // subscription
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone(() {
      print('OnDone was called');
    });
    // // transformer
    // transformer = StreamTransformer<int, int>.fromHandlers(
    //   handleData: (value, sink) {
    //     sink.add(value);
    //   },
    //   handleError: (error, stackTrace, sink) {
    //     sink.add(-1);
    //   },
    //   handleDone: (sink) => sink.close(),
    // );
    // stream
    //     .transform(transformer)
    //     .listen((event) {
    //       setState(() {
    //         lastNumber = event;
    //       });
    //     })
    //     .onError((error) {
    //       setState(() {
    //         lastNumber = -1;
    //       });
    //     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streamnya Rangga')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(values),
            Text(lastNumber.toString()),
            // const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    numberStreamController.close();
    subscription.cancel();
    super.dispose();
  }
}
