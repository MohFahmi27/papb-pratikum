String? emailValidator(String? value) {
  const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
  final regExp = RegExp(pattern);

  if (value == null) {
    return 'Enter an email';
  } else if (!regExp.hasMatch(value)) {
    return 'Enter a valid email';
  } else {
    return null;
  }
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}
