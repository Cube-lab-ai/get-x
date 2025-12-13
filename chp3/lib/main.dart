// ✅ what does get.offnamed does

// Removes the CURRENT screen
// Pushes the new screen (/cart)
// The screen before the removed screen remains in the stack

// ✅ What Get.offAll() Does
// Get.offAll(HomePage());

// This will:
// ✔ Remove ALL previous screens
// ✔ Remove the current screen
// ✔ Push only the new screen
// ✔ Stack becomes ONE clean page
// ❌ No back button (nothing to go back to)

// ------------------------------------------------------------------------------
// ✅ Your Pages

// ProductListPage → shows all products
// ProductDetailsPage → shows selected product
// CartPage
// CheckoutPage

// 🎯 Your Required Navigation Flow

// 1️⃣ Product List → Product Details
// User can go back (normal behavior)
// Get.to(() => ProductDetailsPage());

// 2️⃣ Product Details → Cart Page
// User should NOT see Product Details when back button pressed
// Get.off(() => CartPage());

// 3️⃣ Cart Page → Checkout Page
// Also remove Cart Page from back stack
// Get.off(() => CheckoutPage());

// 4️⃣ Checkout Page → Product List Page
// You want:
// ✔ Remove ALL pages
// ✔ Return directly to product list
// ✔ Disable back button to checkout
// Get.offAll(() => ProductListPage());

// 📌 Final Navigation Diagram
// ProductListPage
//      ↓ Get.to()
// ProductDetailsPage
//      ↓ Get.off()
// CartPage
//      ↓ Get.off()
// CheckoutPage
//      ↓ Get.offAll()
// ProductListPage  (final page)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/cart_controller.dart';
import 'package:getx_state_management/routes/page_routes.dart';
import 'package:getx_state_management/routes/routes.dart';
import 'package:getx_state_management/views/product_page.dart';

void main() {
  Get.put(CartController()); // CartController instance
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
