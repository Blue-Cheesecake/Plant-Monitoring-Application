import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wireless_project/models/user_data.model.dart';
import 'package:wireless_project/providers/authentication.provider.dart';
import 'package:wireless_project/utils/constants/firebase_collection_path.constant.dart';

class UserPlantViewModel {
  final _firestore = FirebaseFirestore.instance;
  late final AuthenticationProvider _authenticationProvider;

  UserPlantViewModel(BuildContext context) {
    _authenticationProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );
  }

  Future<DocumentSnapshot<UserDataModel>> fetchData() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 200));
    return _firestore
        .collection(FirebaseCollectionPath.fireStorePath.users)
        .doc(_authenticationProvider.currentUserDocId!)
        .withConverter(
          fromFirestore: UserDataModel.fromFirestore,
          toFirestore: (value, options) =>
              UserDataModel("", "", "", "", []).toFirestore(),
        )
        .get();
  }
}
