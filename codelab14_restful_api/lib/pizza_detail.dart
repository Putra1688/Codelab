import 'package:flutter/material.dart';
import 'model/pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;
  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String operationResult = '';
  final HttpHelper helper = HttpHelper(); // Inisialisasi HttpHelper

  // --- FUNGSI GABUNGAN: POST & PUT ---
  // Fungsi ini menentukan apakah akan memanggil POST (isNew: true) atau PUT (isNew: false)
  Future<void> savePizza() async {
    // 1. Ambil nilai dari Controller
    final id = int.tryParse(txtId.text) ?? 0;
    final name = txtName.text;
    final desc = txtDescription.text;
    final price = double.tryParse(txtPrice.text) ?? 0.0;
    final imageUrl = txtImageUrl.text;

    // 2. Buat objek Pizza
    Pizza pizzaToSave = Pizza(
      id: id,
      pizzaName: name,
      description: desc,
      price: price,
      imageUrl: imageUrl,
    );

    // 3. Panggil API secara kondisional
    String result;
    if (widget.isNew) {
      // POST: Untuk membuat Pizza baru
      result = await helper.postPizza(pizzaToSave);
    } else {
      // PUT: Untuk mengedit Pizza yang sudah ada
      result = await helper.putPizza(pizzaToSave);
    }

    // 4. Update UI dengan hasil operasi dan kembali
    setState(() {
      operationResult = result;
    });

    // Kembali ke halaman sebelumnya (setelah sukses)
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pop(context);
    }
  }
  // ------------------------------------

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Isi TextField dengan data Pizza jika ini mode EDIT
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Tentukan Judul dan Label Tombol secara dinamis
    String title = widget.isNew ? 'New Pizza (POST)' : 'Edit Pizza (PUT)';
    String buttonText = widget.isNew ? 'Save New Pizza (POST)' : 'Update Pizza (PUT)';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Field ID: Hanya dapat diedit di mode NEW
              TextField(
                controller: txtId,
                decoration: const InputDecoration(
                  hintText: 'Insert ID (Unique)',
                  labelText: 'Pizza ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                enabled: widget.isNew, // Nonaktifkan di mode EDIT (PUT)
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtName,
                decoration: const InputDecoration(
                  hintText: 'Insert Pizza Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtDescription,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Insert Description',
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(
                  hintText: 'Insert Price',
                  labelText: 'Price (€)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(
                  hintText: 'Insert Image Url',
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // Tombol penuh lebar
                ),
                child: Text(buttonText),
                onPressed: () {
                  // Panggil fungsi kondisional yang menangani POST atau PUT
                  savePizza();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}