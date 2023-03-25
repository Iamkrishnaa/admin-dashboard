import 'package:admin_dashboard/app/modules/dashboard/views/dashboard_view.dart';
import 'package:admin_dashboard/app/modules/home/controllers/side_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/local/language_service.dart';
import '../../../services/local/theme_service.dart';

class HomeController extends GetxController {
  final SideMenuController sideMenuController = Get.find();

  @override
  onInit() {
    super.onInit();
    ThemeService.initializeTheme();
    LanguageService.initializeLanguage();
  }

  List<Widget> body = [
    DashboardView(),
    Container(
      child: const Text("Hello"),
    ),
  ];

  Widget getBody(int index) {
    if (index < body.length) {
      return body[index];
    }
    return body[0];
  }
}
