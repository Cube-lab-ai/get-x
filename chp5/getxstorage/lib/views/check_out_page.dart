import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out Page')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.offNamed('/product-page');
          },
          child: Text('Back to Product Details Page'),
        ),
      ),
    );
  }
}
