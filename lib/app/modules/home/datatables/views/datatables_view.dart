import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/datatables_controller.dart';

class DatatablesView extends GetView<DatatablesController> {
  const DatatablesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'DatatablesView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
