class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  const Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // The fromJson constructor takes a Map<String, dynamic>
  // and initializes a Pizza object from it.
  factory Pizza.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json['id'].toString()) ?? 0;
    // final id = json['id'];
    final pizzaName = json['pizzaName'] != null ? json['pizzaName'].toString() : 'No name';
    final description = json['description'].toString();
    final price = double.tryParse(json['price'].toString()) ?? 0.0;
    final imageUrl = json['imageUrl'] ?? '';

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
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
