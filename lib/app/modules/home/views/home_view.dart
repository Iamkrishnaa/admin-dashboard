import 'package:admin_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:admin_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/drawer/side_drawer.dart';
import '../../../widgets/header/header.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: !Responsive.isDesktop(context),
      drawer: SideDrawer(),
      body: SafeArea(
        child: Responsive(
          mobile: Column(
            children: const [
              Header(),
            ],
          ),
          tablet: Column(
            children: const [
              Header(),
            ],
          ),
          desktop: Row(
            children: [
              SideDrawer(),
              Expanded(
                child: Column(
                  children: [
                    const Header(),
                    Expanded(
                      child: Obx(
                        () => homeController.getBody(
                          homeController
                              .sideMenuController.selectedNavigation.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
