import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/utils.dart';
import 'package:localization_theme_management/service/translation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: Locale("en", "TA"),
      fallbackLocale: Locale('en', 'US'),
      home: Scaffold(body: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale("en", "US")) {
                Get.updateLocale(Locale("en", "TA"));
              } else {
                Get.updateLocale(Locale("en", "US"));
              }
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Center(child: Text('home_screen'.tr)),
    );
  }
}
