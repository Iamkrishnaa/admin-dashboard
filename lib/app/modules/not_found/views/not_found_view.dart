import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/not_found_controller.dart';

class NotFoundView extends GetView<NotFoundController> {
  const NotFoundView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotFoundView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotFoundView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
