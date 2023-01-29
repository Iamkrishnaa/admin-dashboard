import 'package:admin_dashboard/app/constants/constants.dart';
import 'package:admin_dashboard/app/modules/home/controllers/home_controller.dart';
import 'package:admin_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          itemCount: 100,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 4 / 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Center(
                                child: Text(
                                  "hello $index",
                                ),
                              ),
                            );
                          },
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
