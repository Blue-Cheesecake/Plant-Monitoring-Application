import 'dart:developer';

import 'package:wireless_project/utils/enums/gender.dart';

class UserRegist {
  String fullName = "";
  String username = "";
  String email = "";
  String password = "";
  Gender gender = Gender.female;
  DateTime dob = DateTime(2023);

  int get age => DateTime.now().year - dob.year;

  void logCurrentInfo() {
    log(
        'Current User Registration Info\n'
        'Full name: $fullName\n'
        'User name: $username\n'
        'Email    : $email\n'
        'Password : $password\n'
        'Gender   : $gender\n'
        'Dob      : ${dob.toString()}\n'
        'Age      : $age\n',
        time: DateTime.now());
  }
}
