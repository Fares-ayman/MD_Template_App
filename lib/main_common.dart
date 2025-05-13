import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
// Add any other shared imports here (e.g., firebase, universal_platform, etc.)

class MyApp extends StatelessWidget {
  final String environment;

  const MyApp({
    Key? key,
    required this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application ${environment.toUpperCase()}",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}

Future<void> mainCommon(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  ///: TODO: Add firebase plugins
  /// and don`t forget to add google-services.json file to android/app/
  /* if (!UniversalPlatform.isWeb) {
    if (!kReleaseMode) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  } */
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp(
    environment: environment,
  ));
}
