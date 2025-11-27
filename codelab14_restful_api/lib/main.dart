import 'package:flutter/material.dart';
import 'model/pizza.dart';
import 'httphelper.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  // Deklarasi HttpHelper sebagai anggota kelas
  final HttpHelper helper = HttpHelper();

  // Memperbaiki fungsi agar hanya memanggil httpHelper.getPizzaList()
  Future<List<Pizza>> callPizzas() async {
    return await helper.getPizzaList();
  }

  // Fungsi untuk refresh data setelah kembali dari PizzaDetailScreen
  void refreshPizzaList() {
    setState(() {
      // Panggil setState untuk memicu FutureBuilder memuat ulang data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RANGGA - JSON',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue, Colors.yellow],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Pizza>>(
        // Tentukan tipe secara eksplisit
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilkan CircularProgressIndicator saat menunggu data
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // Tampilkan pesan error jika terjadi kesalahan
            return Center(
              child: Text('Something went wrong: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Tampilkan pesan jika data kosong
            return const Center(child: Text('No pizzas found.'));
          }

          // Data berhasil dimuat
          List<Pizza> pizzas = snapshot.data!;
          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = pizzas[position];
              return ListTile(
                title: Text(pizza.pizzaName),
                subtitle: Text(
                  '${pizza.description} - € ${pizza.price.toString()}',
                ),
                onTap: () async {
                  // Navigasi ke detail untuk EDIT (PUT)
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaDetailScreen(
                        pizza: pizza,
                        isNew: false, // Ini untuk EDIT (PUT)
                      ),
                    ),
                  );
                  // Refresh data saat kembali
                  refreshPizzaList();
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Navigasi ke detail untuk ADD NEW (POST)
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                // --- PERBAIKAN DI SINI ---
                // Berikan nilai default untuk 'id' dan parameter 'required' lainnya.
                pizza: Pizza(id: 0),
                // -------------------------
                isNew: true, // Ini untuk ADD NEW (POST)
              ),
            ),
          );
          // Refresh data saat kembali
          refreshPizzaList();
        },
      ),
    );
  }
}
