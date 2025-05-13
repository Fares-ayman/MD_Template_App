import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetConnectivityService extends GetxService {
  final _connectivity = Connectivity();
  final RxBool isConnected = true.obs;
  bool _isDialogShowing = false;

  @override
  void onInit() {
    super.onInit();

    _startConnectivityStream();
  }

  Future<void> _checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      isConnected.value = false;
    }
  }

  void _startConnectivityStream() {
    _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        log(">>>>>Internet Connectivity Changed: $result ===>>> Has Internet: ${isConnected.value}");

        _updateConnectionStatus(result);
      },
    );
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    isConnected.value = result != ConnectivityResult.none;

    if (!isConnected.value && !_isDialogShowing) {
      showNoInternetDialog();
    } else if (isConnected.value && _isDialogShowing) {
      Get.back();
      _isDialogShowing = false;
    }
  }

  Future<bool> checkInternetConnectivity() async {
    await _checkConnectivity();
    return isConnected.value;
  }

  void showNoInternetDialog() {
    _isDialogShowing = true;

    /// TODO: Open the Network error dialog in case no network available
    /* Get.dialog(
      const NetworkErrorView(),
      barrierDismissible: false,
      useSafeArea: true,
      barrierColor: const Color.fromARGB(150, 0, 0, 0),
    ); */
  }
}
