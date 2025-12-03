import 'package:get/get.dart';
import 'package:getx_state_management/controller/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
