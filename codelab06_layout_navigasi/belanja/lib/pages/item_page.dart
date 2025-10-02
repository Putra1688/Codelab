import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ambil arguments dari HomePage
    final Item itemArg = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(title: Text(itemArg.name)),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Nama: ${itemArg.name}'),
      //       Text('Harga: ${itemArg.price}'),
      //       ],
      //   ),
      // ),

      // Di dalam body Scaffold ItemPage
      body: Column(
        children: [
          Hero(
            // <-- Bungkus dengan Hero
            tag: 'item_photo_${itemArg.name}', // <-- Gunakan tag yang sama
            child: Image.network(itemArg.img),
          ),
          const SizedBox(height: 16),
          Text('Nama: ${itemArg.name}', style: const TextStyle(fontSize: 24)),
          Text(
            'Harga: Rp ${itemArg.price}',
            style: const TextStyle(fontSize: 20),
          ),
          Text('Stok: ${itemArg.stock}', style: const TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(
                'Rating: ${itemArg.rating}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
