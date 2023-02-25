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

  // Use this hashcode for user document id
  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  // ignore: unnecessary_overrides
  bool operator ==(Object other) {
    return super == other;
  }
}
