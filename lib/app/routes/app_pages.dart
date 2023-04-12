import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/datatables/bindings/datatables_binding.dart';
import '../modules/home/datatables/views/datatables_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ADMIN_DASHBOARD;

  //TODO: Need to add auth middleware
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      children: [
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
          transition: Transition.noTransition,
          middlewares: [
            NavigationMiddleWare(),
          ],
        ),
        GetPage(
          name: _Paths.DATATABLES,
          page: () => const DatatablesView(),
          binding: DatatablesBinding(),
          transition: Transition.noTransition,
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => AdminDashboardView(),
      binding: AdminDashboardBinding(),
      transition: Transition.noTransition,
    ),
  ];
}

class NavigationMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      arguments: {
        "route": route,
      },
    );
  }
}
