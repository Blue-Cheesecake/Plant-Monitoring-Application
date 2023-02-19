import 'dart:developer';

class UserDto {
  String email = "";
  String password = "";

  void logCurrentInfo() {
    log(
        'Current User Data Transfer Object\n'
        'Email   : $email\n'
        'Password: $password\n',
        time: DateTime.now());
  }
}
