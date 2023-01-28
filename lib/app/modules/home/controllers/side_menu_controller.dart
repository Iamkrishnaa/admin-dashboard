import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var selectedNavigation = 0.obs;

  changeNavigation(int index) {
    selectedNavigation.value = index;
    update();
  }
}
