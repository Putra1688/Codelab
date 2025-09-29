import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Infinity Castle Arc',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kimetsu no Yaiba',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          /* soal 3*/
          Icon(Icons.star, color: Colors.red[500]),
          const Text("41"),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        '''Infinity Castle adalah benteng mistis dalam serial Demon Slayer: Kimetsu no Yaiba. Strukturnya penuh dengan lorong berliku dan ruangan yang selalu berubah, memberikan suasana dramatis sekaligus misterius. Desainnya terinspirasi dari ryokan Jepang tradisional, khususnya Ryokan Ookawaso di Fukushima.

Infinity Castle menjadi lokasi pertempuran klimaks antara Korps Pembasmi Iblis dan para Upper Moon. 
Oleh: Rangga Dwi Saputra (NIM: 2341720248)''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout Rangga - 2341720248',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo - 2341720248')),
        // body: const Center(
        //   child: Text('Hello World, Rangga Dwi Saputra is coming in flutter!'),
        body: ListView(children: [
          Image.asset(
            'images/infinity_castle.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection, buttonSection, textSection]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
