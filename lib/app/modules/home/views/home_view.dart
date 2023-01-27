import 'package:admin_dashboard/app/services/local/theme_service.dart';
import 'package:admin_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Container(),
        tablet: Container(),
        desktop: Container(
          child: Center(
            child: ElevatedButton(
              child: const Text("Change Theme"),
              onPressed: () {
                ThemeService.changeTheme(
                  ThemeService.selectedTheme == ThemeCategory.dark
                      ? ThemeCategory.light
                      : ThemeCategory.dark,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
