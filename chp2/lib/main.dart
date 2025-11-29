import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_state_management/routes/page_routes.dart';
import 'package:getx_state_management/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRoutes.routes,
      initialRoute: Routes.product, // This loads ProductView()
    );
  }
}
