void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  (String, int) mahasiswa = ('Rangga Dwi Saputra', 2341720248);
  print(mahasiswa);

  var mahasiswa2 = ('Rangga Dwi Saputra', a: 2, b: true, '2341720248');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);

  // --- cara menggunakan fungsi tukar ---
  var pasangan = (10, 20);        // record (int, int)
  var hasil = tukar(pasangan);    // panggil fungsi tukar
  print("Sebelum tukar: $pasangan");
  print("Sesudah tukar: $hasil");
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
