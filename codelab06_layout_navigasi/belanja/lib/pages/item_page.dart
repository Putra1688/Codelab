import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemArg = ModalRoute.of(context)!.settings.arguments as Item;

    final heroTag = 'item_photo_${itemArg.hashCode}';

    return Scaffold(
      // hapus AppBar agar gambar bisa sampai ke atas layar
      body: Stack(
        children: [
          // ## 1. GAMBAR PRODUK SEBAGAI LATAR BELAKANG ##
          Hero(
            tag: heroTag,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45, // 45% dari tinggi layar
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(itemArg.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Tombol kembali (back button)
          Positioned(
            top: 40.0,
            left: 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // ## 2. LEMBAR KONTEN YANG BISA DI-SCROLL ##
          DraggableScrollableSheet(
            initialChildSize: 0.6, // start 60% tinggi layar
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ## NAMA PRODUK ##
                        Text(
                          itemArg.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ## HARGA PRODUK ##
                        Text(
                          'Rp ${itemArg.price}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // ## INFO RATING DAN STOK ##
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoChip(
                              icon: Icons.star,
                              label: '${itemArg.rating} Rating',
                              iconColor: Colors.amber,
                            ),
                             _buildInfoChip(
                              icon: Icons.inventory_2,
                              label: 'Stok: ${itemArg.stock}',
                              iconColor: Colors.blueAccent,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // ## DESKRIPSI PRODUK ##
                        const Text(
                          'Deskripsi Produk',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ini adalah deskripsi untuk produk. Saya dapat menambahkan detail lebih lanjut dibagian ini agar pelanggan lebih tertarik. Sayangnya ini masih dummy yang bukan dari variable item.',
                          style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
                        ),
                        const SizedBox(height: 30),

                        // ## 3. TOMBOL AKSI (CALL TO ACTION) ##
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logika untuk menambahkan ke keranjang
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${itemArg.name} ditambahkan ke keranjang!')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Tambahkan ke Keranjang',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget helper untuk membuat info chip yang rapi
  Widget _buildInfoChip({required IconData icon, required String label, required Color iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}