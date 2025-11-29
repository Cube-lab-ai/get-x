import 'package:get/state_manager.dart';
import 'package:getx_state_management/models/product_model.dart';

class ProductController extends GetxController {
  // [].obs makes the list itself observable, meaning
  // whenever items are added, removed, or updated in the list,
  // GetX will update the UI automatically (if the UI uses Obx, GetX, etc.).
  var product = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    product.addAll([
      ProductModel(name: 'product 1', price: 23),
      ProductModel(name: 'product 2', price: 34),
    ]);
    super.onInit();
  }

  void addProduct(String name, int price) {
    product.add(ProductModel(name: name, price: price));
  }

  void calculateTotalAmont() {
    product.fold(0, (sum, item) => sum + item.price);
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
