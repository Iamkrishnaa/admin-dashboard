import 'package:get/get.dart';

import '../../../services/local/language_service.dart';
import '../../../services/local/theme_service.dart';

class AdminDashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeAppResources();
  }

  initializeAppResources() async {
    await ThemeService.initializeTheme();
    await LanguageService.initializeLanguage();

    Get.offAllNamed("home");
  }
}
