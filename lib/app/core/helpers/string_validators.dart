class StringValidators {
  static String fieldEmpty = "Field can't be empty";
  static String verificationCodeValidation = "Code field can't be empty";

  static String? validateEmail(String? email) {
    email=email?.trim();
    final  emptyValidation = validateEmpty(email);
    if (emptyValidation != null) return _emptyValidation('Email');

    email = email!;

    final String exp = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

    if (!RegExp(exp).hasMatch(email)) return _wrongStructure("email");

    return null;
  }

  static String? validatePassword(String? password) {
    final emptyValidation = validateEmpty(password);
    if (emptyValidation != null) return   _emptyValidation('Password');
    //
    // password = password!;
    //
    // String exp = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    //
    // if (!RegExp(exp).hasMatch(password)) return _wrongStructure("password");

    return null;
  }
  static String? validateMobile(String? mobile) {
    final emptyValidation = validateEmpty(mobile);
    if (emptyValidation != null) return emptyValidation;

    mobile = mobile!;

    final exp = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    if (!RegExp(exp).hasMatch(mobile)) return _wrongStructure("mobile");

    return null;
  }

  // Empty or null validation return fieldEmpty
  static String? validateEmpty(String? value) {
    if (value == null) return fieldEmpty;
    if (value.isEmpty) return fieldEmpty;
    return null;
  }
  static String? validate4FieldsEmpty(String? value) {
    if (value == null) return verificationCodeValidation;
    if (value.isEmpty) return verificationCodeValidation;
    if (value.length < 4) return verificationCodeValidation;
    return null;
  }

  static String _wrongStructure(String type) {
    return "Invalid $type format";
  }
  static String _emptyValidation(String type) {
    return "$type field can't be empty";
  }
}
