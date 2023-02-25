import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? newUser) {
    _user = newUser;
    log(_user?.email ?? "Null");
    notifyListeners();
  }
}
