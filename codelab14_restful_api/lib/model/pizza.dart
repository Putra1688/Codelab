// Konstanta kunci untuk mapping JSON
const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    this.id = 0, // <--- UBAH DI SINI
    this.pizzaName = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
  });

  // The fromJson constructor takes a Map<String, dynamic>
  // and initializes a Pizza object from it.
  factory Pizza.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json[keyId].toString()) ?? 0;
    // final id = json['id'];
    final pizzaName = json[keyName] != null ? json['pizzaName'].toString() : 'No name';
    final description = json[keyDescription].toString();
    final price = double.tryParse(json[keyPrice].toString()) ?? 0.0;
    final imageUrl = json[keyImage] ?? '';

    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId : id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
