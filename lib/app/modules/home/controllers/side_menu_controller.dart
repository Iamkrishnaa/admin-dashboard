import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var selectedNavigation = "/admin/dashboard".obs;

  changeNavigation(String route) {
    selectedNavigation.value = route;
    changeUrl(route, title: route);
    update();
  }

  static changeUrl(String url, {String? title}) {
    if (kIsWeb) {
      window.history.pushState(null, title ?? "", url);
    }
  }
}
