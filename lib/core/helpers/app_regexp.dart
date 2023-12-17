class AppRegExp {
  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacters(password) &&
        hasMinLength(password);
  }

  static bool hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  static bool hasSpecialCharacters(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool hasMinLength(String password) {
    return password.length >= 6;
  }
}