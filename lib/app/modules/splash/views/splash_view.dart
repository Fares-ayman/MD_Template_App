import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      onIgnore: () {
        controller.navigateToLogin();
        return true;
      },
      onLater: () {
        controller.navigateToLogin();
        return true;
      },
      upgrader: Upgrader(
        willDisplayUpgrade: controller.willDisplayUpgrade,
        debugLogging: appFlavor == 'dev' ? true : false,
        debugDisplayAlways: appFlavor == 'dev' ? true : false,
        languageCode: Get.locale?.languageCode,
        messages: UpgraderMessages(code: Get.locale?.languageCode),
        durationUntilAlertAgain: const Duration(
          seconds: 1,
        ),
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your logo here
              const FlutterLogo(
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                'Your App Name',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
