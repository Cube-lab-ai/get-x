import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  bool loadThemeFromStroage() => Get.isDarkMode;

  ThemeMode get theme =>
      loadThemeFromStroage() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
