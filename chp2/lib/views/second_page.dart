import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/models/product_model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Receive the passed product
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${product.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Price: ${product.price}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
