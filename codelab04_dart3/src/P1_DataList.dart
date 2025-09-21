void main() {
// LANGKAH 1
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // List final dengan panjang 5, default value null
  final List<String?> list = List.filled(5, null);

// LANGKAH 3
  // Isi nama dan NIM (index mulai dari 0)
  list[1] = "Rangga Dwi Saputra"; // index ke-1
  list[2] = "220411100133";       // index ke-2

  // Cetak semua elemen
  print(list);

}
