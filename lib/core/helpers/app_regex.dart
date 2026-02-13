class AppRegex {
  static bool isResolveMessageValid(String value) {
    return RegExp('^[\\w\\d\\s.,!?\'"-]{3,500}\$').hasMatch(value);
  }
    static bool hasLowercase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }
  static bool hasUppercase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }
  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*\d)').hasMatch(password);
  }
  static bool hasMinLength(String password) {
    return RegExp(r'.{8,}').hasMatch(password);
  }
  static bool hasSpecialChar(String password) {
    return RegExp(r'^(?=.*[@$!%*?&])').hasMatch(password);
  }
  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^\d{10}$').hasMatch(phoneNumber);
  }

  static bool isValidEmail(String value) {
    return RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$').hasMatch(value);
  
  }

  static bool isValidUsername(String value) {
    return RegExp(r'^[a-zA-Z0-9_\s]{3,20}$').hasMatch(value);
  }
}