import 'package:get/get.dart';
import 'dart:developer';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    log("fsdjhfhdsgjhsdgjsdf??????>>>>>>>>>>>");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
