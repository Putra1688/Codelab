class simulasiDatabase {
  late String koneksi;

  void connect() {
    print("Mengubungkan ke database...");
    koneksi = "Database Terkoneksi (ID:2341720348)";
    print("Terhubung!");
  }
  void getStatus() {
    print("Status: $koneksi"); // .connect() sudah dipanggil, jadi tidak error
  }
}

void main() {
  var db = simulasiDatabase();
  db.connect(); // harus memanggil connect() dulu sebelum getStatus()
  db.getStatus(); // jika getStatus() dipanggil duluan atau connect() tidak diekseskusi, maka akan error
}