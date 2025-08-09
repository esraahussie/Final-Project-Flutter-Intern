import 'package:email_validator/email_validator.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Please enter your email';
  if (!EmailValidator.validate(value)) return 'Invalid email';
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) return 'Please enter your name';
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) return 'Please enter your phone number';
  if (value.length != 11) return 'Invalid phone number';
  if (!['011', '010', '012', '015'].any((prefix) => value.startsWith(prefix))) {
    return 'Invalid phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Please enter password';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}
