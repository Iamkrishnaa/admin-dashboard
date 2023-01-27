import 'package:admin_dashboard/app/constants/app_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  AdminDashboardView({Key? key}) : super(key: key);
  final AdminDashboardController adminDashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppConstant.getLoadingWidget(),
      ),
    );
  }
}
