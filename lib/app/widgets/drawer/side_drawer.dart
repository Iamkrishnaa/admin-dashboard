import 'package:admin_dashboard/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/assets_path.dart';
import '../../modules/home/controllers/side_menu_controller.dart';
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
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "New",
                        style: Get.textTheme.labelSmall,
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 12, 99, 170),
                  ),
                  isActive:
                      Routes.DASHBOARD == controller.selectedNavigation.value,
                  onTap: () {
                    controller.changeNavigation(Routes.DASHBOARD);
                  },
                ),
                ExpansionTile(
                  title: const Text("Pages"),
                  children: [
                    DrawerListTile(
                      leading: const Icon(
                        Icons.table_chart_sharp,
                      ),
                      title: Text(
                        "Datatables",
                        style: Get.textTheme.titleMedium,
                      ),
                      isActive: Routes.DATATABLES ==
                          controller.selectedNavigation.value,
                      onTap: () {
                        controller.changeNavigation(Routes.DATATABLES);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
