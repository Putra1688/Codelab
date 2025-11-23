import 'package:flutter/material.dart';
import 'dart:convert';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Demo by Rangga',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  int appCounter = 0;

  // praktikum 5
  String documentsPath = '';
  String tempPath = '';

  // praktikum 6
  late File myFile;
  String fileText = '';

  //  praktikum 7
  final pwdController = TextEditingController();
  String myPass = '';
  String fileContent = '';

  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  // Future<void> readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(
  //     context,
  //   ).loadString('assets/pizzalist.json');
  //   setState(() {
  //     pizzaString = myString;
  //   });
  // }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  Future readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJSON(myPizzas);
    print(json);
    return myPizzas;
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter - Rangga') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter - rangga', appCounter);
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  // praktikum 5
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  // praktikum 6
  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Rangga, 2341720248, TI3G');
      return true;
    } catch (e) {
      return false;
    }
  }

  // Method untuk menulis ke file dengan input dari TextField
  Future<bool> writeFileWithInput() async {
    try {
      await myFile.writeAsString(
        pwdController.text,
      ); // Gunakan input dari TextField
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      // Read the file.
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      // On error, return false.
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      // writeFile();
    });
    // super.initState();

    // readAndWritePreference();
    // readJsonFile().then((value) {
    //   setState(() {
    //     appCounter = appCounter;
    //   });
    // });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('JSON-RANGGA')),
  //     body: ListView.builder(
  //       itemCount: myPizzas.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text(myPizzas[index].pizzaName),
  //           subtitle: Text(myPizzas[index].description),
  //           trailing: Text(
  //             // Format harga menjadi 2 angka desimal dan tambahkan mata uang (€)
  //             '€ ${myPizzas[index].price.toStringAsFixed(2)}',
  //             style: const TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('JSON-RANGGA')),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Text(
  //             'You have opened the app $appCounter times.',
  //             style: const TextStyle(fontSize: 20),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               deletePreference();
  //             },
  //             child: const Text('Rangga Reset counter'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider Rangga')),
      body: Center(
        // Pakai Center biar rapi di tengah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Ke tengah vertikal
          children: [
            // 1. Tempat Input
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  labelText: 'Ketik sesuatu di sini',
                ),
              ),
            ),

            // 2. Tombol Simpan
            ElevatedButton(
              child: const Text('Save Value'),
              onPressed: () {
                writeToSecureStorage();
              },
            ),

            const SizedBox(height: 10), // Jarak dikit
            // 3. Tombol Baca
            ElevatedButton(
              child: const Text('Read Value'),
              onPressed: () {
                readFromSecureStorage().then((value) {
                  setState(() {
                    myPass = value; // Data masuk ke variabel
                  });
                });
              },
            ),

            const SizedBox(height: 30), // Jarak agak jauh
            // 4. DI SINI HASILNYA AKAN MUNCUL
            const Text("Hasil Data Tersimpan:"), // Label
            Text(
              myPass, // <--- INI VARIABEL YANG AKAN TAMPIL
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text('Doc path: $documentsPath'),
  // Text('Temp path $tempPath'),
  // ElevatedButton(
  //   child: const Text('Read File'),
  //   onPressed: () => readFile(),
  // ),
  // Text(fileText),
}
