import 'dart:developer';

class UserDtoModel {
  String email = "";
  String password = "";

  void logCurrentInfo() {
    log(
        'Current User Data Transfer Object\n'
        'Email   : $email\n'
        'Password: $password\n',
        time: DateTime.now());
  }

  bool isAllEmpty() {
    return email.isEmpty && password.isEmpty;
  }
}
