String? emailValidator(String? email) {
  if (email == null) {
    return 'Email cannot be blank';
  }

  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return 'Email should have a valid format';
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null) {
    return 'Password cannot be blank';
  }

  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(password)) {
    return 'Password should have at least 8 letters, one digit and one upper case letter';
  }

  return null;
}

String? Function(String?) minLengthValidator(int count) {
  return (String? value) {
    if (value == null || value.length < count) {
      return 'Minimum length should be $count';
    }

    return null;
  };
}
