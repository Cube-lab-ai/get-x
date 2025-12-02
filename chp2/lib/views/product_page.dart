import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController _controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text('Product Page', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart-page');
            },
            icon: Icon(Icons.card_travel, color: Colors.white),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: _controller.product.length,
          itemBuilder: (context, index) {
            final product = _controller.product[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
              ),
            );
          },
        );
      }),
    );
  }
}
