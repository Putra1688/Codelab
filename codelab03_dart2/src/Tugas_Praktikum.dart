// Fungsi untuk mengecek apakah sebuah angka adalah bilangan prima
bool isPrime(int n) {
  // Bilangan prima harus lebih besar dari 1
  if (n <= 1) {
    return false;
  }
  // Bilangan prima hanya bisa dibagi habis oleh 1 dan dirinya sendiri.
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  String namaLengkap = "Rangga Dwi Saputra";
  String nim = "2341720248";

  print("Mencari bilangan prima dari 0 sampai 201...");
  print("---------------------------------------------");

  int u = 1;
  // Loop setiap angka dari 0 hingga 201
  for (int i = 0; i <= 201; i++) {
    // Panggil fungsi isPrime untuk mengecek angka saat ini
    if (isPrime(i)) {
      print("Bilangan prima ke-$u ditemukan: $i. \n $namaLengkap, NIM: $nim");
      print("---------------------------------------------");
      u++;
    }
  }
}
