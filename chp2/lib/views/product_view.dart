import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController _productController = Get.put(ProductController());

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // List
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: _productController.product.length,
                  itemBuilder: (context, index) {
                    var items = _productController.product[index];
                    return ListTile(
                      title: Text(items.name),
                      subtitle: Text(items.price.toString()),
                      onTap: () {
                        Get.toNamed('/product-details', arguments: items);
                      },
                    );
                  },
                );
              }),
            ),

            SizedBox(height: 12),

            // Price field
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                hintText: 'Enter Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Name field
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(
                hintText: 'Enter Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
