import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streamnya Rangga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  void changeColor() async{
    await for (var eventColor in colorStream.getColorStream()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Streamnya Rangga'),
      ),
      body : Container (
        decoration: BoxDecoration (
          color: bgColor,
        ),
      ),
    );
  }
}

