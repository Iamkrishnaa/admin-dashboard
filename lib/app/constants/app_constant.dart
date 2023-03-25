import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppConstant {
  static Widget getLoadingWidget({Color color = Colors.white}) =>
      SpinKitChasingDots(
        color: color,
      );
  static OutlineInputBorder roundedInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(
      100,
    ),
  );
}
