import 'package:get/get.dart';

class CounterController extends GetxController {
  // 0.obs makes the variable observable.
  var count = 0.obs; // reactive variable

  void increment() {
    count++;
  }
}
