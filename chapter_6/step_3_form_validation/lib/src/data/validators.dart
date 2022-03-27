bool isPhoneNumber(String? value) {
  return !_anyLetter.hasMatch(value!) &&
      _phoneRegExp.hasMatch(value.replaceAll(_nonDigitsExp, ''));
}

bool isEmail(String? value) {
  return _emailRegExp.hasMatch(value!);
}

final RegExp _phoneRegExp = RegExp(r'^\d{7,15}$');
final RegExp _nonDigitsExp = RegExp(r'[^\d]');
final RegExp _anyLetter = RegExp(r'[A-Za-z]');
final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");
