import 'package:get/state_manager.dart';
import 'package:getxstorage/models/product_model.dart' show ProductModel;

class ProductController extends GetxController {
  // [].obs makes the list itself observable, meaning
  // whenever items are added, removed, or updated in the list,
  // GetX will update the UI automatically (if the UI uses Obx, GetX, etc.).
  var product = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    product.addAll([
      ProductModel(name: 'product 1', price: 23),
      ProductModel(name: 'product 2', price: 34),
    ]);
    super.onInit();
  }
}
