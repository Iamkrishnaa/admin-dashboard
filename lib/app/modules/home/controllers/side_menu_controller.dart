import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var selectedNavigation = "/admin/dashboard".obs;

  changeNavigation(String route) {
    selectedNavigation.value = route;
    update();
  }
}
