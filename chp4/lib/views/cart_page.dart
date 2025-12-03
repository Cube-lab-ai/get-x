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
                        Get.defaultDialog(
                          title: 'Remove Item',
                          middleText: 'Are you sure want to remove from cart',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            cartController.removeFromCart(product);
                            Get.back();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed('/checkout-page');
                  },
                  child: Text("Proceed to Checkout"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        color: Colors.white,
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.check_outlined),
                              title: Text('Proceed to checkout'),
                            ),
                            ListTile(
                              leading: Icon(Icons.card_travel),
                              title: Text('Cart Page'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text('More Action'),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
