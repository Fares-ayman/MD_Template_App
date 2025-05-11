


/// TODO: dummy provider for example 

/* class UserAuthProvider extends AppProvider {
  Future<bool> updateUserfcmToken(String userId, String fcmToken) async {
    Response<dynamic> result;

    final FormData data = FormData({
      "User_UID": userId,
      "firebase_device_token": fcmToken,
    });
    do {
      result =
          await handleNetworkError(post(EndPoints.updateUserFCMToken, data));
    } while (await shouldRetry());

    if (!result.isOk) {
      return false; // Throw an error for upper layer to handle
    }
    return true;
  }
} */
