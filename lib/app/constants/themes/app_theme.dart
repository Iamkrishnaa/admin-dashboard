import 'package:admin_dashboard/app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.lightScaffoldBackgroundColor,
    drawerTheme: const DrawerThemeData()
        .copyWith(backgroundColor: AppColor.lightCardColor),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.darkScaffoldBackgroundColor,
    drawerTheme: const DrawerThemeData().copyWith(
      backgroundColor: AppColor.darkCardColor,
    ),
  );
}
