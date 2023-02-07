import 'package:admin_dashboard/app/modules/dashboard/views/dashboard_view.dart';
import 'package:admin_dashboard/app/modules/home/controllers/side_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SideMenuController sideMenuController = Get.find();
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
