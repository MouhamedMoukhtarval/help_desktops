class AppRegex {
  static bool isResolveMessageValid(String value) {
    return RegExp('^[\\w\\d\\s.,!?\'"-]{3,500}\$').hasMatch(value);
  }
}