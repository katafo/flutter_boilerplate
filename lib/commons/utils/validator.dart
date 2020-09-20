class Validator {

  static bool isEmptyString(String str) {
    return (str == null || str.trim() == '');
  }

  static bool isValidEmail(String email) {
    final _emailRegExp = RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}');
    return _emailRegExp.hasMatch(email);
  }

}