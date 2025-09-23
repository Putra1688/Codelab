import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_widget/fab_widget.dart';
import 'package:flutter_application_1/basic_widget/loading_cuportino.dart';
import 'package:flutter_application_1/basic_widget/text_widget.dart';
import 'package:flutter_application_1/basic_widget/image_widget.dart';
import 'package:flutter_application_1/basic_widget/my_dialog_widget.dart';
import 'package:flutter_application_1/basic_widget/my_scaffolt_widget.dart';
import 'package:flutter_application_1/basic_widget/my_input_selection_widget.dart';
import 'package:flutter_application_1/basic_widget/my_date_pickers_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Rangga Dwi Saputra'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.title,
      onPressed: _incrementCounter,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        
          child : Column(

          children: <Widget>[
            const SizedBox (height: 16),
            const MyTextWidget(),
            const MyImageWidget(),
            const MyLoadingCupertino(),
            const MyFabWidget(), 
            const MyDialog(),
            const MyInputSelection(),
            const MyDatePickers(title: 'Pilih Tanggal'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox (height: 16),
          ],
        ),
      
    ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment Counter',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
