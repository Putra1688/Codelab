void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  // Tambahkan nama dan NIM
  gifts['nama'] = 'Rangga Dwi Saputra';
  gifts['nim'] = '2341720248';

  nobleGases[20] = 'Rangga Dwi Saputra';
  nobleGases[21] = '2341720248';

  print("Isi gifts:");
  print(gifts);

  print("\nIsi nobleGases:");
  print(nobleGases);

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';

  // Tambahkan nama dan NIM
  mhs2[20] = 'Rangga Dwi Saputra';
  mhs2[21] = '2341720248';

  print("\nIsi mhs1:");
  print(mhs1);

  print("\nIsi mhs2:");
  print(mhs2);
}
