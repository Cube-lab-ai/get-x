class ProductModel {
  final String name;
  final int price;

  ProductModel({required this.name, required this.price});

  factory ProductModel.fromMap(Map<String, dynamic> value) {
    return ProductModel(
      name: value['name'] ?? "",
      price: value['price'] is int
          ? value['price']
          : int.tryParse(value['price'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price};
  }
}
