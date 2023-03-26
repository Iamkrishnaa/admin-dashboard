import 'package:admin_dashboard/app/widgets/layouts/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Text(
                "hello $index",
              ),
            ),
          );
        },
      ),
    );
  }
}
