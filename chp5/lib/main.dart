import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/routes/page_routes.dart';
import 'package:getx_state_management/routes/routes.dart';
import 'package:getx_state_management/services/cart_service_controller.dart';
import 'package:getx_state_management/views/product_page.dart';

void main() {
  GetStorage.init();
  Get.put(CartServiceController());
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
