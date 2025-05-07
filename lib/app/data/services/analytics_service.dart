import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AnalyticsServices extends GetxService {
  static AnalyticsServices? _instance;

  static AnalyticsServices get instance => _instance ??= AnalyticsServices();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);
}
