import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/cart_controller.dart';
import 'package:getx_state_management/models/product_model.dart';
import 'package:getx_state_management/views/product_page.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the product passed via arguments
    ProductModel productModel = Get.arguments;

    // Use the singleton CartController
    CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Product Details', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart-page');
              // Get.toNamed('/cart-page');
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            // Your CartController is scoped to ProductDetailsPage, so when you go back, GetX disposes it.

            // 👉 This means:
            // CartController is created when ProductDetailsPage opens
            // It is owned by that route
            // When you leave ProductDetailsPage (Navigator.pop / back button)
            // GetX auto-disposes all controllers created by that route
            // That is GetX SmartManagement working correctly, not a bug.

            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(productModel.name),
            SizedBox(height: 20),
            Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(productModel.price.toString()),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                cartController.addToCart(productModel);
                Get.snackbar(
                  'Cart Added',
                  '${productModel.name} added to cart successfully',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              icon: Icon(Icons.add_shopping_cart, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
