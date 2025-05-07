import 'dart:async';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  bool callbackCalled = false;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (callbackCalled) {
        return;
      }
      await navigateToLogin();
    });
  }

  Future<void> navigateToLogin() async {
    if (await userIsLoggedIn()) {
      await Get.offAllNamed(Routes.HOME);
      return;
    }
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      /// TODO Replace with your auth route
      Get.offAllNamed(Routes.HOME);
    });
  }

  Future<bool> userIsLoggedIn() async {
    try {
      /// TODO: Add secure storage service and silent login
      /* final String? accessToken = await Get.find<SecureStorageService>()
          .getJWTAccessTokenFromSecureStorage();

      if (accessToken != null && accessToken.isNotEmpty) {
        return true;
      } */
    } catch (e) {
      /// TODO: Add error handling
      // CustomBotToast.showToast(e.toString(), Assets.images.close.path);
    }
    return false;
  }

  Future<void> willDisplayUpgrade(
      {required bool display,
      String? installedVersion,
      UpgraderVersionInfo? versionInfo}) async {
    callbackCalled = true;
    if (!display) {
      await Future.delayed(const Duration(seconds: 1));
      await navigateToLogin();
    }
  }
}
