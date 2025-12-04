import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxstorage/models/product_model.dart';

class CartServiceController extends GetxService {
  final storage = GetStorage();

  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    print('printing');
    // Load from storage on start
    List<dynamic>? storedCart = storage.read('cart-items');
    if (storedCart != null) {
      for (var item in storedCart) {
        print('Item: $item');
      }
      cartItems.assignAll(
        storedCart.map<ProductModel>((e) => ProductModel.fromMap(e)).toList(),
      );
      for (var p in cartItems) {
        print('CartItem object: name=${p.name}, price=${p.price}');
      }
    }

    ever(cartItems, (_) {
      storage.write(
        'cart-items',
        cartItems.map((item) => item.toJson()).toList(),
      );
    });

    super.onInit();
  }

  void addProduct(ProductModel product) {
    cartItems.add(product);
  }

  void removeProduct(ProductModel product) {
    cartItems.remove(product);
  }

  double get calculateTotal =>
      cartItems.fold(0.0, (sum, item) => sum + item.price);
}
