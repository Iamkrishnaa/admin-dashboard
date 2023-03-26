import 'package:admin_dashboard/app/modules/dashboard/views/dashboard_view.dart';
import 'package:admin_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DashboardView();
  }
}
