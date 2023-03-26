import 'package:admin_dashboard/app/modules/home/controllers/side_menu_controller.dart';
import 'package:get/get.dart';
import '../../../services/local/language_service.dart';
import '../../../services/local/theme_service.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    initializeRequiredDependencies();
    super.onInit();
  }

  static initializeRequiredDependencies() async {
    await ThemeService.initializeTheme();
    await LanguageService.initializeLanguage();

    Get.lazyPut<SideMenuController>(
      () => SideMenuController(),
    );
  }
}
