class ValidateFieldUseCase {
  /*
  * Validate phone number
  * Minimum eight characters, at least one upper case English letter, one lower case English letter, one number and one special character
  */
  final _passwordRegex = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$");

  final _nonNumberRegex = RegExp(r"\D");

  final _noWordNumberRegex = RegExp(r"[^\w .]");

  static const String _fieldEmptyMessage = "Field cannot be left empty.";
  static const String _fieldBlankMessage = "Field cannot be left blank.";
  static const String _fieldInvalidMessage = "Invalid field value.";

  static const String fieldConfirmPasswordMessage =
      "Password and confirm password do not match.";

  String? validatePhoneNumber(String value, int minLength, int maxLength) {
    if (value.isEmpty) return _fieldEmptyMessage;
    if (value.trim().isEmpty) return _fieldBlankMessage;
    if (value.contains(_nonNumberRegex) ||
        !(value.length >= minLength && value.length <= maxLength)) {
      return _fieldInvalidMessage;
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) return _fieldEmptyMessage;
    if (value.trim().isEmpty) return _fieldBlankMessage;
    if (value.contains(_noWordNumberRegex)) return _fieldInvalidMessage;
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return _fieldEmptyMessage;
    if (value.trim().isEmpty) return _fieldBlankMessage;
    if (!_passwordRegex.hasMatch(value)) return _fieldInvalidMessage;
    return null;
  }

  String? validateUserId(String value) {
    if (value.isEmpty) return _fieldEmptyMessage;
    if (value.trim().isEmpty) return _fieldBlankMessage;
    if (!(value.length >= 5)) return _fieldInvalidMessage;
    return null;
  }

  String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) return _fieldEmptyMessage;
    if (value.trim().isEmpty) return _fieldBlankMessage;
    if (!_passwordRegex.hasMatch(value)) return _fieldInvalidMessage;
    if (value != password) return fieldConfirmPasswordMessage;
    return null;
  }
}
