void main () {

  int counter=1;
  while (counter < 33) {
    print(counter);
    counter++;
  }

  do {
    print(counter);
    counter++;
  } while (counter<77);

  print("------------------------------");
  print ("""2.1
    Eror terjadi karena variabel counter belum didefinisikan, sehingga program bingung eror isi awalnya apa
    Kode 'while' berjalan dengan cara var counter yang sudah dikasi nilai awal akan ditampilkan dengan nilai yang terus bertambah nilainya selama kurang dari 33""");

  print("------------------------------");
  print ("""2.2
    Kode 'do-while' tersebut akan menampilkan nilai dari counter, yang setiap iterasi nilainya akan terus bertambah selama kurang dari 77
    Nilai counter awal pada program didapat dari sisa berjalannya program 'while' sebelumnya""");
}

