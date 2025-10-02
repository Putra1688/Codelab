import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List item
  final List<Item> _items = [
    Item(
      name: 'Sugar',
      price: 5000,
      img:
          'https://lirp.cdn-website.com/cbf48001/dms3rep/multi/opt/Different+Types+of+Sugar-1920w.jpg',
      stock: 10,
      discount: 20,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      discount: 0,
      price: 3000,
      img:
          'https://www.thermofisher.com/blog/wp-content/uploads/2015/10/istock_000019748589_medium.jpg',
      stock: 15,
      rating: 4.8,
    ),
    Item(
      name: 'Cooking Oil',
      price: 12000,
      img:
          'data:image/jpeg;base64,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',
      stock: 20,
      discount: 10,
      rating: 4.9,
    ),
    Item(
      name: 'Flour',
      price: 8000,
      img:
          'data:image/jpeg;base64,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',
      stock: 8,
      discount: 50,
      rating: 4.7,
    ),
  ];

  // Variabel state untuk menyimpan daftar item yang ditampilkan
  late List<Item> _filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // tampilkan semua item di awal
    _filteredItems = List.from(_items);

    // Listener untuk search bar
    _searchController.addListener(() {
      _filterItems();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Fungsi filter pencarian nama
  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  // Fungsi mengurutkan harga item (rendah ke tinggi)
  void _sortItemsByPriceAsc() {
    setState(() {
      _filteredItems.sort((a, b) => a.price.compareTo(b.price));
    });
  }

  // Fungsi mengurutkan herga item (tinggi ke rendah)
  void _sortItemsByPriceDesc() {
    setState(() {
      _filteredItems.sort((a, b) => b.price.compareTo(a.price));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Catalogue'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // ## UI UNTUK SEARCH DAN FILTER ##
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search product...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Tombol Filter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _sortItemsByPriceAsc,
                      icon: const Icon(Icons.arrow_upward),
                      label: const Text('Harga Terendah'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _sortItemsByPriceDesc,
                      icon: const Icon(Icons.arrow_downward),
                      label: const Text('Harga Tertinggi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ## UI UNTUK GRID VIEW ##
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 item per baris
                childAspectRatio: 0.75, // Mengatur rasio aspek item
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              // Gunakan _filteredItems yang sudah dinamis
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                  child: Card(
                    // Perbaikan Tampilan Card
                    elevation: 4.0,
                    margin: const EdgeInsets.all(4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior:
                        Clip.antiAlias, // Agar gambar mengikuti bentuk card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              // Gambar produk
                              Positioned.fill(
                                child: Image.network(
                                  item.img,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),

                              // Label diskon (pojok kiri atas)
                              if (item.discount > 0)
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${item.discount}% OFF",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            12.0,
                            12.0,
                            12.0,
                            6.0,
                          ),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'Rp ${item.price}',
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            12.0,
                            6.0,
                            12.0,
                            12.0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
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

          // Footer
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blueAccent,
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
