import 'package:flutter/services.dart';

class AppConstants {
  const AppConstants._();

  // TODO: change base url
  static const String baseUrl = appFlavor == 'dev' ? "" : "";
}
