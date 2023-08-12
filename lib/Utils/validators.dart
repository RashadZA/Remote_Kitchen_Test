part of 'design_utils.dart';

class AuthValidator {
  static String? phoneValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";
    if (value != null && value.length != 10) {
      return "Phone number must be of exact 10 digits!";
    }
    if (value != null && !GetUtils.isPhoneNumber(value.trim())) {
      return "Invalid phone number!";
    }
    return null;
  }

  static String? emptyNullValidator(
    String? value, {
    String? errorMessage = "required!",
  }) {
    if (value?.trim().isEmpty ?? true) return errorMessage;
    return null;
  }

  static String? urlValidator(String? value) {
    if (value?.trim().isEmpty ?? true) return "required!";

    if (value != null && !value.isURL) {
      return "Invalid URL";
    }
    return null;
  }
}
