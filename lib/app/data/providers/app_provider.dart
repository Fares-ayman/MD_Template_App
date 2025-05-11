import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class AppProvider extends GetConnect {
  final RxBool _networkUnAvailable = false.obs;

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.maxAuthRetries = 1;
    httpClient.defaultContentType = 'application/form-data';
    httpClient.followRedirects = true;
    httpClient.addRequestModifier<dynamic>((request) => updateHeaders(request));
    httpClient.timeout = const Duration(seconds: 10);
    // Initialize Network state listener
    ever(_networkUnAvailable, networkStatusChanged);
  }

  // Header:-----------------------------------------------------------------------
  Future<Map<String, dynamic>?> getHeaders() async {
    /// TODO: Add token in header  for all requests
    /* final User? user = FirebaseAuth.instance.currentUser;
    final String? token = await user?.getIdToken();
    return token != null
        ? {
            "Authorization-Firebase": token,
            "X-Authorization-Firebase": token,
            'Connection': 'keep-alive'
          }
        : null; */
    return {};
  }

  void networkStatusChanged(bool networkUnAvailable) {
    if (networkUnAvailable == true) {
      /// TODO: Open the Network error dialog in case no network available

      /* showDialog(
        context: Get.context!,
        builder: (ctx) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomHomeDialog(
            isUrlImage: false,
            assetImageSvg: AppAssets.KloseConnectionSvg,
            title: LocalKeys.kSorryNetworkErrorOccurred.tr,
            titleTextStyle: AppTextStyles.headlinesText.copyWith(
              fontSize: 22.sp(Get.context!),
              color: AppColors.blueblack,
            ),
            buttonName: LocalKeys.kReconnect.tr,
            tap: () {
              Get.back(result: true);

              shouldRetry();
            },
          ),
        ),
      ); */
    } else {
      if (Get.isDialogOpen != null && Get.isDialogOpen == true) {
        // Get.back(closeOverlays: true); // Closes the Network Dialog
      }
    }
  }

  FutureOr<Request<dynamic>> updateHeaders(Request<dynamic> request) async {
    request.headers['Accept'] = 'application/json';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';

    /*  final User? user = FirebaseAuth.instance.currentUser;
    final String? token = await user?.getIdToken();
    if (token != null) {
      request.headers['Authorization-Firebase'] = token;
      request.headers['X-Authorization-Firebase'] = token;
      request.headers['Connection'] = 'keep-alive';
    } */

    return request;
  }

  Future<Response<dynamic>> handleNetworkError(
      Future<Response<dynamic>> response) {
    response.then((value) {
      return _networkUnAvailable.value = (value.hasError &&
          (value.statusCode == null ||
              value.statusCode == HttpStatus.requestTimeout));
    });

    return response;
  }

  Future<bool> shouldRetry() async {
    if (_networkUnAvailable.value == false) {
      return false; // return instantly if network is already available => should not retry
    }
    await Future.delayed(
        const Duration(seconds: 15)); // Wait for appropriate time
    return _networkUnAvailable.value;
  }
}
