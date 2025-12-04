import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstorage/routes/page_routes.dart';
import 'package:getxstorage/routes/routes.dart';
import 'package:getxstorage/views/product_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
