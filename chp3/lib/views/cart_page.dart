import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: Obx(() {
        return Column(
          children: [
            Text(
              "Total: ₹${cartController.totalAmounts.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.price.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Get.offNamed('/checkout-page');
              },
              child: Text("Proceed to Checkout"),
            ),
          ],
        );
      }),
    );
  }
}
