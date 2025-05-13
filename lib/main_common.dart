import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_app.dart';

Future<void> mainCommon() async {
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
  runApp(const MyApp());
}
