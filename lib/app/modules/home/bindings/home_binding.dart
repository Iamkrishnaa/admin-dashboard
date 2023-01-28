import 'package:get/get.dart';

import 'package:admin_dashboard/app/modules/home/controllers/side_menu_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuController>(
      () => SideMenuController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
