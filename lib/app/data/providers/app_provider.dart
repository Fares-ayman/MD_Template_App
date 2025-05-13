import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../services/internet_connectivity_service.dart';

class AppProvider extends GetConnect {
  final RxBool _networkUnAvailable = false.obs;
  final RxBool isDialogOpen = false.obs;
  final RxBool isServerDown = false.obs;
  InternetConnectivityService internetConnectivityService =
      Get.find<InternetConnectivityService>();
  Worker? worker;

  @override
  void onInit() {
    httpClient.maxAuthRetries = 1;

    httpClient.defaultContentType = 'application/json';
    httpClient.followRedirects = true;

    httpClient.timeout = const Duration(seconds: 30);
    httpClient.addRequestModifier<dynamic>((request) => updateHeaders(request));
    httpClient.addAuthenticator<dynamic>((request) async {
      /// TODO: Add accessToken for all requests
      /*  String? accessToken;

      try {
        accessToken = await Get.find<SecureStorageService>()
            .getJWTAccessTokenFromSecureStorage();
        log(accessToken ?? 'not Found');
        // ignore: empty_catches
      } catch (e) {
        log(e.toString());
      }

      if (accessToken != null && accessToken.isNotEmpty) {
        request.headers[HttpHeaders.authorizationHeader] =
            "Bearer $accessToken";
      } */
      return request;
    });

    worker = ever(_networkUnAvailable, networkStatusChanged);
  }

  @override
  void onClose() {
    worker?.dispose();
    dispose();
    super.onClose();
  }

  void networkStatusChanged(bool networkUnAvailable) {
    if (networkUnAvailable == true) {
      isDialogOpen.value = true;
      // Open the Network error dialog in case no network available
      internetConnectivityService.showNoInternetDialog();
    } else {
      if (isDialogOpen.value) {
        isDialogOpen.value = false;
        Get.back(); // Closes the Network Dialog
      }
    }
  }

  FutureOr<Request<dynamic>> updateHeaders(Request<dynamic> request) async {
    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = '*/*';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';

    /// TODO: Add token in header for all requests

    /*  String? accessToken;

    try {
      accessToken = await Get.find<SecureStorageService>()
          .getJWTAccessTokenFromSecureStorage();
      log(accessToken ?? 'not Found');
      // ignore: empty_catches
    } catch (e) {
      log(e.toString());
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      request.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    } */

    return request;
  }

  Future<Response<dynamic>> handleNetworkError(
    Future<Response<dynamic>> response,
  ) async {
    _networkUnAvailable.value =
        !(await internetConnectivityService.checkInternetConnectivity());

    await response.then((value) {
      _networkUnAvailable.value = (value.hasError &&
          (value.statusCode == null ||
              value.statusCode == HttpStatus.requestTimeout));

      log("Network Availability: ${value.statusCode}");
      log("Network Availability: ${value}");
      log(response.toString());
    });
    return response;
  }

  Future<bool> shouldRetry() async {
    if (_networkUnAvailable.value == false) {
      return false; // return instantly if network is already available => should not retry
    }
    await Future.delayed(const Duration(seconds: 10));
    return _networkUnAvailable.value;
  }
}
