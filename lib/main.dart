import 'dart:developer';

import 'package:admin_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/constants/constants.dart';
import 'app/modules/not_found/bindings/not_found_binding.dart';
import 'app/modules/not_found/views/not_found_view.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  await Hive.initFlutter();

  await Hive.openBox("adminPanel");

  await HomeController.initializeRequiredDependencies();

  runApp(
    const AdminDashBoard(),
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.1),
    ),
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class AdminDashBoard extends StatelessWidget {
  const AdminDashBoard({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Admin Dashboard".tr,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const NotFoundView(),
        binding: NotFoundBinding(),
      ),
    );
  }
}
