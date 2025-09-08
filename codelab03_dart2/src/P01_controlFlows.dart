void main () {
  String test = "test2";

  if (test == "test1") {
    print("Test 1");  // blok kode untuk test1 jika variabel test bernilai "test1"
  } else if (test == "test2") {
    print("Test 2"); // blok kode untuk test2 jika variabel test bernilai "test2"
  } else {
    print("Bukan test 1 atau test 2"); // blok kode jika variabel test bukan "test1" atau "test2"
  }

  if (test == "test2") print ("Test 2 again"); // tanpa kurung kurawal, hanya satu pernyataan yang dijalankan jika kondisi terpenuhi

  test ="true";
  if (test == "true") {
    print("Kebenaran");
  }
  print("------------------------------");
  print("""Nomor 1 
  Karena di awal sudah diinisialisasi bahwa variabel test adalah 'test2', maka outputnya adalah:
  Test 2 
  yang kemudian diikuti dengan: 
  Test 2 again""");
  print("------------------------------");
  print("""Nomor 2
  variabel test sudah dideklarasikan diawal dengan tipe String
  sehingga jika ingin menggunakan variabel tersebut lagi, maka cukup ditulis nama variabel tanpa perlu mendeklarasikan ulang tipe datanya
  kode nomer 2 berjalan dengan cara, "jika variabel test bernilai "true", maka blok kode di dalam if akan dijalankan""");
}



