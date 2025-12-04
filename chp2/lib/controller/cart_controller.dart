import 'package:get/state_manager.dart';
import 'package:getx_state_management/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  var totalAmounts = 0.0.obs;

  void addToCart(ProductModel cartProduct) {
    cartItems.add(cartProduct);
    calculateTotalAmount();
  }

  void removeFromCart(ProductModel cartProdct) {
    cartItems.remove(cartProdct);
    calculateTotalAmount();
  }

  // calculate total amount
  void calculateTotalAmount() {
    totalAmounts.value = cartItems.fold(
      0,
      (value, element) => (value + element.price),
    );
    print(totalAmounts.value);
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


// fold function implementation
// before understand the implementation understand how ananymous function works in order to understand fold

// E myFold<E, T>(List<T> list, E initialValue, E Function(E, T) combine) {
//   var accumulator = initialValue;

//   for (var element in list) {
//     accumulator = combine(accumulator, element);
//   }

//   return accumulator;
// }


// var result = myFold([1, 2, 3], 0, (acc, x) => acc + x);
// print(result)