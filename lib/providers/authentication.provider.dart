import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  User? _user;
  String? _currentUserDocId;

  User? get user => _user;
  String? get currentUserDocId => _currentUserDocId;

  void setUser(User? newUser) {
    _user = newUser;
    log(_user?.email ?? "Null");
    notifyListeners();
  }

  void setCurrentUserDocId(String? id) {
    _currentUserDocId = id;
    notifyListeners();
  }
}
