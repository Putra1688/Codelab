import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/pizza.dart';

class HttpHelper {
  final String authority = '9y6jr.wiremockapi.cloud';
  final String path = 'pizzalist';
  final String pizzaPath = 'pizza'; // Path dasar untuk operasi tunggal

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

      List<Pizza> pizzas = List<Pizza>.from(
        jsonResponse.map((i) => Pizza.fromJson(i)),
      );

      return pizzas;
    } else {
      // Lebih baik melempar Exception daripada mengembalikan list kosong
      // jika ini adalah API utama untuk data.
      throw Exception(
        'Failed to load pizza list. Status: ${result.statusCode}',
      );
    }
  }

  // --- Fungsi POST (Menambah Pizza Baru) ---
  Future<String> postPizza(Pizza pizza) async {
    String post = json.encode(pizza.toJson());
    // POST biasanya ke path koleksi, e.g., /pizza
    Uri url = Uri.https(authority, pizzaPath);

    http.Response r = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: post,
    );

    // Penanganan status POST yang lebih baik (biasanya 201 Created)
    if (r.statusCode == HttpStatus.created || r.statusCode == HttpStatus.ok) {
      return r.body.isNotEmpty
          ? r.body
          : 'Status: ${r.statusCode} (POST Success)';
    } else {
      throw Exception('POST failed: ${r.statusCode} ${r.body}');
    }
  }

  // --- Fungsi PUT (Mengubah Pizza yang Sudah Ada) ---
  Future<String> putPizza(Pizza pizza) async {
    String put = json.encode(pizza.toJson());
    // PERBAIKAN: Menggunakan ID sebagai segmen path: /pizza/{id}
    if (pizza.id == null) {
      throw Exception('Cannot PUT: Pizza ID is required.');
    }
    Uri url = Uri.https(authority, '$pizzaPath/${pizza.id}');

    http.Response r = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: put,
    );

    // Tambahkan penanganan status (200 OK atau 204 No Content)
    if (r.statusCode == HttpStatus.ok || r.statusCode == HttpStatus.noContent) {
      return r.body.isNotEmpty
          ? r.body
          : 'Status: ${r.statusCode} (PUT Success)';
    } else {
      // Melempar Exception untuk ditangkap di PizzaDetailScreen
      throw Exception('PUT failed: ${r.statusCode} ${r.body}');
    }
  }

  // --- Fungsi DELETE (Menghapus Pizza) ---
  Future<String> deletePizza(int id) async {
    const deletePath = '/pizza';
    Uri url = Uri.https(authority, deletePath);
    http.Response r = await http.delete(url);
    return r.body;
  }
}
