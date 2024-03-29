import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ThemeCategory { light, dark, system }

class ThemeService extends GetxService {
  static ThemeCategory selectedTheme = ThemeCategory.system;
  Box box = Hive.box("adminPanel");

  static initializeTheme() async {
    await setAppTheme();
  }

  static setAppTheme() async {
    ThemeCategory themeCategory = await ThemeService().loadThemeFromStorage();

    if (themeCategory == ThemeCategory.system) {
      Get.changeThemeMode(ThemeMode.system);
      selectedTheme = ThemeCategory.system;
    } else {
      if (themeCategory == ThemeCategory.dark) {
        Get.changeThemeMode(ThemeMode.dark);
        selectedTheme = ThemeCategory.dark;
      } else {
        Get.changeThemeMode(ThemeMode.light);
        selectedTheme = ThemeCategory.light;
      }
    }
  }

  saveAppTheme(bool isDark) async {
    if (box.isOpen) {
      box.put("isAppThemeDark", isDark);
    }
  }

  Future<ThemeCategory> loadThemeFromStorage() async {
    if (box.isOpen) {
      bool? isDark = box.get("isAppThemeDark");

      if (isDark != null) {
        if (isDark) {
          return ThemeCategory.dark;
        } else {
          return ThemeCategory.light;
        }
      }
    }

    return ThemeCategory.system;
  }

  static changeTheme(ThemeCategory themeCategory) async {
    if (themeCategory == ThemeCategory.system) {
      resetTheme();
    } else if (themeCategory == ThemeCategory.dark) {
      ThemeService().saveAppTheme(true);
    } else {
      ThemeService().saveAppTheme(false);
    }

    setAppTheme();
  }

  static resetTheme() async {
    Box box = Hive.box("adminPanel");
    if (box.isOpen) {
      box.delete("isAppThemeDark");
    }
  }
}
