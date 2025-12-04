class ProductModel {
  final String name;
  final int price;
  ProductModel({required this.name, required this.price});

  factory ProductModel.fromMap(Map<String, dynamic> value) {
    return ProductModel(name: value['name'] ?? "", price: value['price'] ?? "");
  }

  ProductModel toJson() {
    return ProductModel(name: name, price: price);
  }
}
