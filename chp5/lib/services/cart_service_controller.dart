import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/models/product_model.dart';

class CartServiceController extends GetxService {
  var storage = GetStorage();
  var cartItems = <ProductModel>[].obs;
  @override
  void onInit() {
    List<dynamic>? storedCart = storage.read<List<dynamic>?>('cart-items');
    if (storedCart != null) {
      cartItems.assignAll(
        storedCart.map((value) {
          return ProductModel.fromMap(value);
        }).toList(),
      );
    }
    // here value is List<ProductModel>

    // ever() listens to changes in an Rx variable (cartItems)
    // Every time cartItems changes (add, remove, assignAll, etc.), the callback runs
    // In your case, it automatically saves the cart to GetStorage whenever the cart updates
    ever(cartItems, (value) {
      storage.write('cart-items', value.map((item) => item.toJson()).toList());
    });
    super.onInit();
  }

  void addProduct(ProductModel product) {
    cartItems.add(product);
  }

  void removeProduct(ProductModel product) {
    cartItems.remove(product);
  }

  double get calculateTotal {
    return cartItems.fold(
      0.0,
      (sum, item) =>
          sum + item.price, // or price * quantity if you have quantity
    );
  }
}
