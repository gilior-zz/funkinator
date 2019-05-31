String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return '';
  else
    return null;
}

String ValidateIsEmpty(String value) {
  if (value.isEmpty) {
    return '';
  } else
    return null;
}

const ERROR_EMAIL_ALREADY_IN_USE='ERROR_EMAIL_ALREADY_IN_USE';
const ERROR_WEAK_PASSWORD='ERROR_WEAK_PASSWORD';
const ERROR_WRONG_PASSWORD="ERROR_WRONG_PASSWORD";
const ERROR_USER_NOT_FOUND="ERROR_USER_NOT_FOUND";
