import 'package:get/get.dart';

import '../controllers/datatables_controller.dart';

class DatatablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatatablesController>(
      () => DatatablesController(),
    );
  }
}
