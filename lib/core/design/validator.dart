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

}