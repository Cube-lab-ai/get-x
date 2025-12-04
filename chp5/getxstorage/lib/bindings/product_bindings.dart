import 'package:get/get.dart';
import 'package:getxstorage/controller/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // Lazily instantiate ProductController when ProductPage is opened
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
