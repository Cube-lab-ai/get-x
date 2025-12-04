// import 'package:get/get.dart';
// import 'package:getxstorage/controller/cart_controller.dart';
// import 'package:getxstorage/services/cart_service_controller.dart';

// class CartBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(CartController());
//   }
// }

import 'package:get/get.dart';
import 'package:getxstorage/controller/cart_controller.dart';
import 'package:getxstorage/services/cart_service_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // Ensure CartServiceController is available globally
    Get.lazyPut<CartServiceController>(() => CartServiceController());

    // Lazily instantiate CartController when needed
    Get.lazyPut<CartController>(() => CartController());
  }
}
