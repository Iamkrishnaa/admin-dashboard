import 'package:get/get.dart';

import '../../home/controllers/side_menu_controller.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuController>(
      () => SideMenuController(),
    );
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );
  }
}
