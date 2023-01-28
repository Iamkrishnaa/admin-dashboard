import 'package:admin_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:admin_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/drawer/side_drawer.dart';

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
      body: Responsive(
        mobile: Container(),
        tablet: Container(),
        desktop: Container(
          child: Row(
            children: [
              SideDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
