import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Layouts in Flutter';

    // kiri
    // JUDUL & DESKRIPSI
    final titleText = Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: const Text(
        'Mie Ayam',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Georgia', // Contoh font
        ),
      ),
    );

    final descriptionText = Text(
      '''Mie ayam adalah salah satu makanan khas Indonesia yang populer. Hidangan ini terdiri dari mie kuning yang disajikan dengan potongan ayam berbumbu gurih, sering dilengkapi bakso, pangsit, atau sayuran. Rasanya hangat, lezat, dan cocok dinikmati kapan saja. ''',
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'Georgia', fontSize: 8),
    );

    // RATING
    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500], size: 8),
        Icon(Icons.star, color: Colors.green[500], size: 8),
        Icon(Icons.star, color: Colors.green[500], size: 8),
        const Icon(Icons.star, color: Colors.black, size: 8),
        const Icon(Icons.star, color: Colors.black, size: 8),
      ],
    );

    final ratings = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          // const SizedBox(width: 3),
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 1,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );

    // ICONS LIST
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 8,
      height: 2,
    );

    // DefaultTextStyle.merge() allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    final iconList = IconTheme(
      data: const IconThemeData(size: 14),
      child: DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.kitchen, color: Colors.green[500]),
                  const Text('PREP:'),
                  const Text('25 min'),
                ],
              ),
              // const SizedBox(width: 8),
              Column(
                children: [
                  Icon(Icons.timer, color: Colors.green[500]),
                  const Text('COOK:'),
                  const Text('1 hr'),
                ],
              ),
              // const SizedBox(width: 8),
              Column(
                children: [
                  Icon(Icons.restaurant, color: Colors.green[500]),
                  const Text('FEEDS:'),
                  const Text('4-6'),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // LEFT COLUMN
    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

      // decoration: BoxDecoration( ... ), // memberi border
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [titleText, descriptionText, ratings, iconList],
      ),
    );

    // kanan
    // MAIN IMAGE
    final mainImage = Container(
      padding: const EdgeInsets.only(right: 16.0),
      // width: 300.0, // Menentukan lebar
      // height: 250.0, // Menentukan tinggi
      child: Image.asset('images/mie_ayam.webp', fit: BoxFit.cover),
    );

    // GABUNGKAN SEMUA
    final mainLayout = Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Agar rata atas
      children: [
        // Bagian kiri (teks), mengambil 2/5 ruang
        Expanded(
          flex: 2, // Menentukan rasio pembagian ruang
          child: leftColumn,
        ),
        // Bagian kanan (gambar), mengambil 3/5 ruang
        Expanded(
          flex: 3, // Menentukan rasio pembagian ruang
          child: mainImage,
        ),
      ],
    );

    // final gridGambar = Row(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Expanded(child: Image.asset('images/mie_ayam.webp')),
    //     const SizedBox(width: 10),
    //     Expanded(flex: 2, child: Image.asset('images/mie_ayam.webp')),
    //     const SizedBox(width: 10),
    //     Expanded(child: Image.asset('images/mie_ayam.webp')),
    //   ],
    // );

    final gridGambar = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Flex Row Layout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/mie_ayam.webp', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/mie_ayam.webp', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/mie_ayam.webp', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              mainLayout,
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                child: gridGambar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
