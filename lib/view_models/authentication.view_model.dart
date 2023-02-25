import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wireless_project/models/user_dto.model.dart';
import 'package:wireless_project/providers/authentication.provider.dart';

class AuthenticationViewModel {
  final _auth = FirebaseAuth.instance;
  late AuthenticationProvider _authenticationProvider;

  AuthenticationViewModel(BuildContext context) {
    _authenticationProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );
  }

  /// The signin method used in only Sign in View
  ///
  /// Return [True] if successfully login, othereise [False]
  Future<bool> signIn(UserDtoModel userDto) async {
    if (userDto.isAllEmpty()) {
      log("Cannot log in: User DTO is all Empty");
      return false;
    }
    try {
      await Future.delayed(const Duration(seconds: 1));
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: userDto.email, password: userDto.password);
      _authenticationProvider.setUser(userCredential.user);

      return true;
    } on FirebaseAuthException catch (e) {
      var message = "There's error on FirebaseAuth";
      if (e.message != null) {
        message = e.message!;
      }
      log("Firebase Auth Exception: $message");

      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _authenticationProvider.setUser(null);
  }
}
