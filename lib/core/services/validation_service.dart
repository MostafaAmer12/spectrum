class ValidationService {
  String? validateEmail(String? value, context) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])+)$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email address is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String? value, context) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else {
      return null;
    }
  }

  String? validateAge(String? value, context) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    } else if (!isNumeric(value)) {
      return 'Enter a valid age';
    }

    return null;
  }

  bool isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = num.tryParse(str);
    return number != null;
  }

  String? validateFullName(String? value, context) {
    String pattern = r'^[a-zA-Z\s]+$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid full name';
    }

    return null;
  }
}
