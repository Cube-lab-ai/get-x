import 'package:get/get.dart';
import 'package:getx_state_management/controller/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
