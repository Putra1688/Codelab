## RANGGA DWI SAPUTRA
Pertemuan 2 : Dart - Tipe Data & Variabel <br>
NIM : 2341720248 <br>
Kelas : TI 3G
<hr>
2. Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan! <br>
3. Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter. <br>
4. Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !
<hr>
=== JAWABAN ===
<hr>
2. Semua pengembangan framework Flutter melibatkan pengetahuan/fitur mendalam dengan bahasa Dart; Kode aplikasi, kode plugin, dan manajemen dependensi semuanya menggunakan bahasa Dart beserta fitur-fiturnya. Memiliki pemahaman dasar yang kuat tentang Dart akan memudahkan untuk menjadi lebih produktif dengan Flutter dan akan membuat Anda merasa nyaman dalam pengembangan Flutter.
<br>
3. Berikut Point Penting yang bisa saya rangkum :
<br>
<ul>
<li> Dart awalnya berfokus pada pengembangan web, dengan tujuan utama menggantikan JavaScript, sekarang telah fokus pada mobile development, termasuk framework Flutter. </li>
<li> JavaScript tidak menyediakan ketahanan seperti banyak bahasa pemrograman lainnya, sehingga Dart ingin menjadi penerus daripada JavaScript. </li>
<li> Dart memiliki perkakas yang modern dan stabil yang telah disediakan oleh plugin IDE. </li>
<li> Fleksibel dan cepat diubah saat dikembangkan dengan JIT. </li>
<li> Super cepat dan efisien saat digunakan oleh pengguna (dengan AOT). </li>
<li> Bisa beradaptasi untuk lingkungan lain seperti web dengan cara "diterjemahkan" ke JavaScript. </li>
<li> Konsep OOP, Operators, Arithmatic, syntaks kurang lebih sama dengan yng lain </li>
</ul>
<br>
4. Berikut perbedaan Inti :
<ul>
<li> Null Safety (?): Anda menggunakan tanda tanya '?' untuk mengizinkan sebuah variabel bernilai null. Ini digunakan ketika sebuah nilai memang bersifat opsional atau mungkin tidak ada.</li>

<li>late: Anda menggunakan late untuk menjanjikan bahwa variabel yang non-nullable (tidak boleh null) akan diinisialisasi (diberi nilai) sebelum pertama kali digunakan.</li>
</ul>
Contoh eksekusi kodenya bisa dilihat di
[Null Safety](<https://github.com/Putra1688/PemrogramanMobile_3G_22_2025/blob/main/Week_02/04_nullSafety.dart>) dan 
[Late String](<https://github.com/Putra1688/PemrogramanMobile_3G_22_2025/blob/main/Week_02/04_lateString.dart>)
