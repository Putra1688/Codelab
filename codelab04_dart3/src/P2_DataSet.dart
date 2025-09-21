void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};

  // .add() untuk menambahkan HANYA 1 elemen
  names1.add("Rangga Dwi Saputra - 2341720248");

  // .addAll() untuk menambahkan BANYAK elemen
  names2.addAll({
    "Rangga Dwi Saputra",
    "2341720248"
  }); 

  print(names1);
  print(names2);
}
