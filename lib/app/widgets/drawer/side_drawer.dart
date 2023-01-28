import 'package:admin_dashboard/app/constants/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/assets_path.dart';
import '../../modules/home/controllers/side_menu_controller.dart';
import '../../services/local/theme_service.dart';
import 'drawer_listtile.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({
    super.key,
  });
  final SideMenuController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuController>(
      init: controller,
      builder: (controller) {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Image.asset(
                        AssetPath.logo,
                        width: 100.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Admin Panel",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontFamily: GoogleFonts.lobster().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                DrawerListTile(
                  leading: const Icon(
                    Icons.dashboard,
                  ),
                  title: Text(
                    "Dashboard",
                    style: Get.textTheme.titleMedium,
                  ),
                  trailing: Badge(
                    label: Text(
                      "New",
                      style: Get.textTheme.labelSmall,
                    ),
                    backgroundColor: const Color.fromARGB(255, 12, 99, 170),
                  ),
                  isActive: 0 == controller.selectedNavigation.value,
                  onTap: () {
                    controller.changeNavigation(0);
                  },
                ),
                DrawerListTile(
                  leading: const Icon(
                    Icons.dark_mode,
                  ),
                  title: Text(
                    "Theme",
                    style: Get.textTheme.titleMedium,
                  ),
                  onTap: () {
                    controller.changeNavigation(1);
                  },
                  isActive: 1 == controller.selectedNavigation.value,
                  trailing: Switch(
                    onChanged: (value) {
                      ThemeService.changeTheme(
                        value ? ThemeCategory.dark : ThemeCategory.light,
                      );
                    },
                    value: ThemeService.selectedTheme == ThemeCategory.dark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
