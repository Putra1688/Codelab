import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/pizza.dart'; // Pastikan path ini benar

class HttpHelper {
  final String authority = '9y6jr.wiremockapi.cloud';
  final String path = 'pizzalist'; // Path untuk GET semua pizza

  // Implementasi Singleton Pattern (sudah benar)
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  // --- Fungsi GET (Mengambil Daftar Pizza) ---
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      
      // Menggunakan List.from() untuk memastikan tipe data yang benar sebelum map
      List<Pizza> pizzas = List<Pizza>.from(
          jsonResponse.map((i) => Pizza.fromJson(i)));
      
      return pizzas;
    } else {
      // Mengembalikan list kosong jika gagal
      return [];
    }
  }

  // --- Fungsi POST (Menambah Pizza Baru) ---
  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza'; // Path untuk POST
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);

    http.Response r = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: post,
    );
    // Mengembalikan status body atau pesan sukses/gagal
    return r.body.isNotEmpty ? r.body : 'Status: ${r.statusCode} (POST)';
  }

  // --- Fungsi PUT (Mengubah Pizza yang Sudah Ada) ---
  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza'; // Path untuk PUT
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    
    http.Response r = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-Type',
      },
      body: put,
    );
    // Mengembalikan status body atau pesan sukses/gagal
    return r.body.isNotEmpty ? r.body : 'Status: ${r.statusCode} (PUT)';
  }
  
  // --- Fungsi DELETE (Menghapus Pizza) ---
  Future<String> deletePizza(int id) async {
    const deletePath = '/pizza';
    Uri url = Uri.https(authority, deletePath);
    http.Response r = await http.delete(
      url,
    );
    return r.body;
  }
}