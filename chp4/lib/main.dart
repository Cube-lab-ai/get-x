// 🔹 1. Instance Created

// When: The constructor of the class runs.

// What happens:
// Memory is allocated for the object.
// Any setup in the constructor executes.
// Key point: The object exists in memory, but it might not be fully ready for use.

// Example:
// class ProductController extends GetxController {
//   ProductController() {
//     print("Instance created");
//   }
// }

// 🔹 2. Instance Initialized
// When: The onInit() method of GetxController runs, after the constructor.

// What happens:
// The controller is fully ready to use.
// You can safely access Rx variables, call APIs, set up listeners, etc.
// Key point: The controller is now initialized and ready.

// Example:
// class ProductController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     print("Instance initialized");
//   }
// }

// Console output (together with constructor):

// Instance created
// Instance initialized
// ✅ Now the controller is ready to be used safely.

// 🧠 Summary Table
// Term	Trigger	What happens
// Instance Created	Constructor runs	Object exists in memory, constructor code executed
// Instance Initialized	onInit() runs	Controller is fully ready, Rx variables, listeners, API calls can safely run

// -----------------------------------------------------------------------------
// 🔹 Why two stages exist in GetX

// Separation of concerns

// Constructor (instance created): Only responsible for creating the object and setting up basic state.

// onInit (instance initialized): Responsible for initialization logic like API calls, listeners, Rx subscriptions, or async setup.

// ✅ This keeps the object creation lightweight and avoids doing heavy operations in the constructor.

// Flexibility and safety
// In Flutter, constructors should not perform async tasks or access context-dependent resources.
// onInit() is called after the object exists, so it’s safe to:
// Access Rx variables
// Call APIs
// Start timers or streams
// Use Get.context
// Lazy loading support

// With Get.lazyPut(), the controller is not created immediately.

// onInit() runs only after the controller is created — separating creation from initialization ensures that all dependencies are ready.

// 🔹 Analogy

// Constructor (Created) → Like building a house frame. The structure exists but nothing inside is ready.

// onInit (Initialized) → Like furnishing the house, connecting electricity, setting up appliances. Now it’s fully usable.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/routes/page_routes.dart';
import 'package:getx_state_management/routes/routes.dart';
import 'package:getx_state_management/views/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.productPage,
      getPages: PageRoutes.routes,
      home: Scaffold(body: ProductPage()),
    );
  }
}
