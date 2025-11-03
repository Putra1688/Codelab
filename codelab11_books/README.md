# codelab11_books

A new Flutter project.

## Praktikum 1: Mengunduh Data dari Web Service (API)

**Soal no 1. Tambahkan nama panggilan pada `title` app sebagai identitas**

```bash
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranggga Dwi Saputra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
```

<br>

**Soal no 2. Cari judul buku di Google Books, lalu ganti `ID` buku pada variabel path di kode tersebut. Kemudian akses di browser URI tersebut untuk menampilkan data JSON**

Link buku asli : https://www.google.co.id/books/edition/The_True_Value_of_Martial_Arts_for_Self/jJAhBwAAQBAJ?hl=id&gbpv=1&dq=self+development&pg=PA52&printsec=frontcover

<img src="image/soal2.png" alt="Hasil Praktikum" width="650"/>

<br>

**Soal no 3. Capture hasil praktikum berupa GIF**

Maksud kode langkah 5 tersebut terkait `substring` dan `catchError!` adalah Kode tersebut menampilkan tombol `“GO!”` yang ketika ditekan akan memanggil fungsi `getData()`. `substring` digunakan untuk membatasi panjang teks yang ditampilkan, sedangkan `catchError` digunakan untuk menangani kesalahan agar program tidak berhenti tiba-tiba.

<img src="image/soal3.webp" style="max-width: 40vw;"/> 

## Praktikum 2: Menggunakan await/async untuk menghindari callbacks
**Soal no 4. Maksud kode langkah 1 dan 2**

Kode tersebut menjalankan tiga fungsi asynchronous yang masing-masing menunggu 3 detik lalu mengembalikan angka 1, 2, dan 3. Fungsi `count() ` memanggil ketiganya secara berurutan (sequential), menjumlahkan hasilnya menjadi 6, lalu menampilkan hasil itu ke UI dengan `setState()`. Total waktu eksekusi sekitar 9 detik.

<img src="image/soal4.webp" style="max-width: 40vw;"/> 



