import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../drawer/side_drawer.dart';
import '../header/header.dart';

class BaseWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final Widget body;
  BaseWidget({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: !Responsive.isDesktop(context),
      drawer: SideDrawer(),
      body: SafeArea(
        child: Responsive(
          mobile: Column(
            children: [
              const Header(),
              Expanded(child: body),
            ],
          ),
          tablet: Column(
            children: [
              const Header(),
              Expanded(child: body),
            ],
          ),
          desktop: Row(
            children: [
              SideDrawer(),
              Expanded(
                child: Column(
                  children: [
                    Header(),
                    Expanded(child: body),
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
