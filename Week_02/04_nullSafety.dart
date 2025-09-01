// mengembalikan nama atau null
String? findPanggilan(String namaLengkap) {
  if (namaLengkap == 'Rangga Pratama') {
    return 'Rangga';
  } else if (namaLengkap == 'Fahdin Addaeroby') {
    return 'Addaeroby';
  } else {
    return null; // mengembalikan null jika nama tidak ditemukan
  }
}

void main() {
  // variabel namaPanggilan boleh kosong (null), jadi tidak error
  String? namaPanggilan = findPanggilan('Rangga Pratama');
  print (namaPanggilan); // Output: Rangga

  String? namaPanggilan2 = findPanggilan('Azhar Steven');
  print(namaPanggilan2); // Output: null
}

// Nama Rangga Pratama telah ditemukan karena sudah diinisialisasi pada fungsi findPanggilan
// Nama Azhar Steven tidak ditemukan sehingga mengembalikan nilai null,
// karena pada fungsi findPanggilan yang diinisialisasi hanya Rangga Pratama dan Fahdin Addaeroby saja
