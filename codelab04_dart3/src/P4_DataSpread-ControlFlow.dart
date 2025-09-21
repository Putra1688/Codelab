void main() {
  // Langkah 1
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  // Langkah 3
  List<int?>? list1 = [1, 2, null];
  var list3 = [0, ...?list1];
  print(list3.length);

  List<String?>? list4 = ['Rangga Dwi Saputra'];
  var list5 = ['NIM: 2341720248', 'Nama: ', ...?list4];
  print(list5);

  // Langkah 4
  bool promoActive = false;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  // Langkah 5
  var login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'User') 'Inventory'];
  print(nav2);

  // Langkah 6
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#5');
  print(listOfStrings);
}
