import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wireless_project/models/user_data.model.dart';
import 'package:wireless_project/models/user_dto.model.dart';
import 'package:wireless_project/models/user_regist.model.dart';
import 'package:wireless_project/providers/authentication.provider.dart';
import 'package:wireless_project/utils/constants/firebase_collection_path.constant.dart';

class AuthenticationViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late AuthenticationProvider _authenticationProvider;

  AuthenticationViewModel(BuildContext context) {
    _authenticationProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );
  }

  /// The registration method used in only Sign up view
  ///
  /// Return [True] if successfully register, othereise [False]
  /// In this case, We use [hashcode] generated from email and password with
  /// the help of [Equatable] package for setting the Id of document.
  Future<bool> signUp(UserRegistModel userRegistModel) async {
    if (userRegistModel.isAllEmpty()) {
      log("Cannot sign up: Some elements are empty");
      return false;
    }

    log("UserRegist Hashcode: ${userRegistModel.hashCode}");

    try {
      await Future.delayed(const Duration(seconds: 1));
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userRegistModel.email,
        password: userRegistModel.password,
      );

      final userDataModel = UserDataModel(
        userRegistModel.email,
        userRegistModel.fullName,
        userRegistModel.gender.name,
        userRegistModel.username,
        [],
      );

      final docRef = _firestore
          .collection(FirebaseCollectionPath.fireStorePath.users)
          .withConverter(
            fromFirestore: UserDataModel.fromFirestore,
            toFirestore: (value, options) => userDataModel.toFirestore(),
          )
          .doc("${userRegistModel.hashCode}");

      docRef.set(userDataModel);
      _authenticationProvider.setUser(userCredential.user);
      _authenticationProvider
          .setCurrentUserDocId("${userRegistModel.hashCode}");

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

  /// The signin method used in only Sign in View
  ///
  /// Return [True] if successfully login, othereise [False]
  Future<bool> signIn(UserDtoModel userDto) async {
    if (userDto.isAllEmpty()) {
      log("Cannot log in: User DTO is all Empty");
      return false;
    }

    log("UserDto Hashcode: ${userDto.hashCode}");

    try {
      await Future.delayed(const Duration(seconds: 1));
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: userDto.email, password: userDto.password);
      log("Successfully Login");

      _authenticationProvider.setUser(userCredential.user);
      _authenticationProvider.setCurrentUserDocId("${userDto.hashCode}");

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
    _authenticationProvider.setCurrentUserDocId(null);
    log("Signed out");
  }
}
