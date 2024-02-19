class Validator {
  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return "Enter email";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return "Enter password";
    } else if (password.length < 7) {
      return "Password must have 8 characters";
    }
    return null;
  }

  static String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
