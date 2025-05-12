import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_d_template_app/app/core/widgets/custom_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomButton(
          key: const Key('custom_button'),
          text: 'Click me',
          onPressed: () {},
          width: 200,
          height: 50,
          isDisabled: true,
        ),
      ),
    );
  }
}
