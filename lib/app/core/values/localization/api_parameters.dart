/// Contains all API parameter names used in the application.
/// These constants are used for query parameters and request bodies.
class ApiParameters {
  const ApiParameters._();

  // Common Parameters
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String newPassword = 'newPassword';
  static const String key = 'key';
  static const String otp = 'otp';
  static const String token = 'token';

  // Account Parameters
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String birthDate = 'birthDate';
  static const String profileImage = 'profileImage';
  static const String publicUrl = 'publicUrl';
  static const String filename = 'filename';

  // Post Parameters
  static const String postId = 'postId';
  static const String employeeId = 'employeeId';
  static const String reactType = 'reactType';

  // Vacation Request Parameters
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
  static const String type = 'type';
  static const String period = 'period';
  static const String note = 'note';
  static const String documents = 'documents';
}
