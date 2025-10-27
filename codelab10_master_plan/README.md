# codelab10_master_plan

A new Flutter project.

## 
1. Berikut demonstrasi praktikum 1

    <img src="img/rec1.webp" style="max-width: 40vw;"/> 

2. Maksud dari langkah 4:
    ```
    export 'plan.dart';
    export 'task.dart';
    ```
    File ini berfungsi sebagai penghubung. Tujuannya untuk Mempermudah import (lebih bersih dan rapi), Menyatukan ekspor model dalam satu pintu masuk, dan Menghindari duplikasi import di banyak file.

3. Mengapa perlu variabel plan di langkah 6?

    Variabel plan digunakan untuk :
    - Tempat menyimpan data rencana utama
    - Digunakan untuk menampilkan daftar task
    - Diperbarui setiap kali user menambah, mencentang, atau mengubah deskripsi task
    
    Tanpa plan, aplikasi kamu nggak tahu task apa yang harus ditampilkan.

4. Langkah 9 GIF nya digabung di nomer 1

    Langkah 9, `_buildTaskTile` digunakan untuk menampilkan satu baris tugas (task) dalam daftar.
Setiap baris berisi Checkbox untuk menandai apakah tugas sudah selesai, dan TextFormField untuk mengedit deskripsi tugas.

    Saat pengguna mencentang atau mengubah teks, fungsi `setState()` dijalankan untuk memperbarui data plan dengan membuat objek Plan baru yang berisi daftar tugas terbaru.
Dengan begitu, tampilan (UI) akan otomatis diperbarui sesuai perubahan data.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

    `initState()` digunakan saat pertama kali widget dibuat untuk menyiapkan data atau controller, seperti membuat ScrollController dan menambahkan listener agar keyboard tertutup saat daftar discroll.
    Sedangkan dispose() dipanggil saat widget dihapus dari layar untuk membersihkan resource, yaitu menghapus scrollController agar tidak terjadi kebocoran memori.
