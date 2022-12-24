class Validations {
  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email address';
    } else if (!value.contains('@') && !value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordlValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Password must be more than 6 characters';
    }
    return null;
  }

  String? naemValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String? profValidation(String? value) {
    if (value == null) {
      return 'Please choose your profession';
    }
    return null;
  }
}
