import 'package:flutter/cupertino.dart';

import 'app_regexp.dart';

class AppValidators {
  static String? validateName(BuildContext context, String? value) {
    if (value!.isEmpty || value == null || !AppRegExp.isNameValid(value)) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value!.isEmpty || value == null || !AppRegExp.isEmailValid(value)) {
      return 'Email is required';
    } else if (!value.contains('@')) {
      return 'Invalid Email';
  }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value!.isEmpty || value == null || !AppRegExp.isPasswordValid(value)) {
      return 'Password is required';
    }
    return null;
  }

  static String? validateConfirmPassword(BuildContext context, String? value) {
    if (value!.isEmpty || value == null || !AppRegExp.isConfirmPasswordValid(value)) {
      return 'Password is required';
    }
    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? value) {
    if (value!.isEmpty || value == null || !AppRegExp.isPhoneNumberValid(value)) {
      return 'Phone Number is required';
    }
    return null;
  }
}