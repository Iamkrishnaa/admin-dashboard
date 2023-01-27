import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LanguageService extends GetxService {
  late Box box;

  static initializeLanguage() {
    setAppLocale();
  }

  static setAppLocale() async {
    String locale = await LanguageService().loadLocaleFromStorage();
    Get.updateLocale(Locale(locale));
  }

  saveAppLocale(String locale) async {
    box = await Hive.openBox("language");
    if (box.isOpen) {
      box.put("appLocale", locale);
    }
  }

  loadLocaleFromStorage() async {
    box = await Hive.openBox("language");
    String appLocale = box.get("appLocale") ??
        (Get.deviceLocale != null ? Get.deviceLocale!.languageCode : "");

    return appLocale;
  }

  static changeLocale({required String languageCode}) async {
    Box box = await Hive.openBox("language");
    box.put("appLocale", languageCode);
    setAppLocale();
  }

  static resetAppLocale() async {
    Box box = await Hive.openBox("language");
    box.delete("appLocale");
  }
}
