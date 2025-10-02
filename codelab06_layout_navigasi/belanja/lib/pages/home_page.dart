import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      img:
          'https://lirp.cdn-website.com/cbf48001/dms3rep/multi/opt/Different+Types+of+Sugar-1920w.jpg',
      stock: 10,
      rating: 4.5,
    ),

    Item(
      name: 'Salt',
      price: 3000,
      img:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCfyZN9toCqOC6ZJCO84eWb86dJOcVdmsaLQ&s',
      stock: 15,
      rating: 4.8,
    ),
    
    Item(
      name: 'Salt',
      price: 3000,
      img:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCfyZN9toCqOC6ZJCO84eWb86dJOcVdmsaLQ&s',
      stock: 15,
      rating: 4.8,
    ),

    Item(
      name: 'Sugar',
      price: 5000,
      img:
          'https://lirp.cdn-website.com/cbf48001/dms3rep/multi/opt/Different+Types+of+Sugar-1920w.jpg',
      stock: 10,
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Catalogue')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              // <-- Ganti dari ListView.builder
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 item per baris
                childAspectRatio: 0.8, // Mengatur rasio aspek item
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Expanded(child: Image.network(item.img, fit: BoxFit.cover)),
                        Expanded(
                          child: Hero(
                            tag: 'item_photo_${item.name}', // <-- Beri tag unik
                            child: Image.network(item.img, fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Rp ${item.price}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              Text(item.rating.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Rangga Dwi Saputra (2341720248)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
