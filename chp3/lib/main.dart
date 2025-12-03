// different types of routings
// get x
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
