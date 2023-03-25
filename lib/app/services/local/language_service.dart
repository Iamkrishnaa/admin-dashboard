import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LanguageService extends GetxService {
  Box box = Hive.box("adminPanel");

  static initializeLanguage() {
    setAppLocale();
  }

  static setAppLocale() async {
    String locale = await LanguageService().loadLocaleFromStorage();
    Get.updateLocale(Locale(locale));
  }

  saveAppLocale(String locale) async {
    if (box.isOpen) {
      box.put("appLocale", locale);
    }
  }

  loadLocaleFromStorage() async {
    String appLocale = box.get("appLocale") ??
        (Get.deviceLocale != null ? Get.deviceLocale!.languageCode : "");

    return appLocale;
  }

  static changeLocale({required String languageCode}) async {
    Box box = Hive.box("adminPanel");
    box.put("appLocale", languageCode);
    setAppLocale();
  }

  static resetAppLocale() async {
    Box box = Hive.box("adminPanel");
    box.delete("appLocale");
  }
}
