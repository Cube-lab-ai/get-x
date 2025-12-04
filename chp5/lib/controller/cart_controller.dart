import 'package:get/get.dart';
import 'package:getx_state_management/models/product_model.dart';
import 'package:getx_state_management/services/cart_service_controller.dart';

class CartController extends CartServiceController {
  final CartServiceController _cartServiceController =
      Get.find<CartServiceController>();

  List<ProductModel> get productList => _cartServiceController.cartItems;

  double get totalAmount => _cartServiceController.calculateTotal;

  void addToCart(ProductModel product) {
    _cartServiceController.addProduct(product);
  }

  void removeCart(ProductModel product) {
    _cartServiceController.removeProduct(product);
  }
}

// ✅ What is fold in Dart?
// fold is a method that reduces a list (or any iterable) into one single value.

// Think of it like this:
// 👉 You start with an initial value
// 👉 You apply a function to each item in the list
// 👉 The function keeps updating the value
// 👉 At the end, you get one final result

// var result = list.fold(initialValue, (previousValue, currentItem) {
//   return updatedValue;
// });

// Parameters:

// initialValue → The starting value
// previousValue → The accumulated value so far
// currentItem → The current element in the list

//ex

// List<int> nums = [1, 2, 3, 4];
// int sum = nums.fold(0, (previous, element) => previous + element);
// print(sum); // 10
