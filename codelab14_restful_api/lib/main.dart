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

  // Future yang akan menahan hasil pemanggilan API
  Future<List<Pizza>>? _pizzasListFuture;

  @override
  void initState() {
    super.initState();
    // Inisialisasi future saat pertama kali widget dibuat
    _pizzasListFuture = callPizzas();
  }

  // Memperbaiki fungsi agar hanya memanggil httpHelper.getPizzaList()
  Future<List<Pizza>> callPizzas() async {
    return await helper.getPizzaList();
  }

  // Fungsi untuk refresh data setelah kembali dari PizzaDetailScreen atau setelah DELETE
  void refreshPizzaList() {
    setState(() {
      // Perbarui Future untuk memicu FutureBuilder memuat ulang data
      _pizzasListFuture = callPizzas();
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
        // Gunakan Future yang sudah diinisialisasi di initState
        future: _pizzasListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No pizzas found.'));
          }

          // Data berhasil dimuat
          List<Pizza> pizzas = snapshot.data!;
          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = pizzas[position];
              return Dismissible(
                key: Key(pizza.id?.toString() ?? position.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) async {
                  final helper = HttpHelper();
                  if (pizza.id != null) {
                    await helper.deletePizza(pizza.id!);
                  }
                  // reload from server
                  refreshPizzaList();
                },
                child: ListTile(
                  title: Text(pizza.pizzaName ?? 'No Name'),
                  subtitle: Text(
                    '${pizza.description ?? 'No description'} - € ${pizza.price?.toStringAsFixed(2) ?? '0.00'}',
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PizzaDetailScreen(pizza: pizza, isNew: false),
                      ),
                    );
                    refreshPizzaList();
                  },
                ),
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
                // Berikan nilai default yang lengkap untuk Pizza baru
                pizza: Pizza(id: 0, pizzaName: '', description: '', price: 0.0),
                isNew: true, // Untuk ADD NEW (POST)
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
