import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zido_community/app/core/widgets/app_scaffold.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        children: [
          Text('Hello'),
        ],
      ),
    );
  }
}
