import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int count;
  const CounterDisplay({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:'),
          Text('$count', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: Container(height: 50.0));
  }
}

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback
  onPressed; // Tipe data untuk fungsi yang tidak memiliki argumen

  const MyScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)),
      body: body,
      
      bottomNavigationBar: const MyBottomNavBar(),

      floatingActionButton: FloatingActionButton(
        onPressed: onPressed, // Gunakan fungsi yang diterima dari luar
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
