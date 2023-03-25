import 'package:get/get.dart';

import '../controllers/not_found_controller.dart';

class NotFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotFoundController>(
      () => NotFoundController(),
    );
  }
}
