class Validator {
  static String? emailValidator(String? email) {
    String pattern =
        r"^([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+)@([a-zA-Z0-9-]+)(\.[a-zA-Z0-9-]{2,})$";
    RegExp regExp = new RegExp(pattern);

    if (email!.isEmpty) {
      return "Enter email";
    } else if (!regExp.hasMatch(email)) {
      return "Please enter valid email address";
    }
    return null;
  }

  static String? nameValidator(String? name) {
    String pattern = r"^[a-zA-Z .-]+$";
    RegExp regExp = new RegExp(pattern);
    if (name!.isEmpty) {
      return "Enter information";
    } else if (!regExp.hasMatch(name)) {
      return "Please enter a valid information";
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

  static String? allValidator(String? value) {
    if (value!.isEmpty) {
      return "Enter information";
    }
    return null;
  }

  static String? phoneValidator(String? phoneNumber) {
    String pattern = r'^[0-9][0-9]{8}$';
    RegExp regExp = new RegExp(pattern);
    if (phoneNumber!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(phoneNumber)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
