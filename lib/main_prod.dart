import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_platform/universal_platform.dart';
import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  final String environment;

  const MyApp({
    Key? key,
    required this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application ${environment.toUpperCase()}",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!UniversalPlatform.isWeb) {
    if (!kReleaseMode) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
  await ScreenUtil.ensureScreenSize();
  const environment = 'prod';
  runApp(const MyApp(
    environment: environment,
  ));
}
