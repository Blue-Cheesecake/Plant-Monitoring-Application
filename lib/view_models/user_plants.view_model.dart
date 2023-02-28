import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wireless_project/models/device_data.model.dart';
import 'package:wireless_project/models/device_regist.model.dart';
import 'package:wireless_project/models/user_data.model.dart';
import 'package:wireless_project/providers/authentication.provider.dart';
import 'package:wireless_project/providers/user_devices.provider.dart';
import 'package:wireless_project/utils/constants/firebase_collection_path.constant.dart';

class UserPlantViewModel {
  final _firestore = FirebaseFirestore.instance;
  final _cloudStorage = FirebaseStorage.instance;
  late final AuthenticationProvider _authenticationProvider;
  late final UserDevicesProvider _userDevicesProvider;

  UserPlantViewModel(BuildContext context) {
    _authenticationProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );
    _userDevicesProvider =
        Provider.of<UserDevicesProvider>(context, listen: false);
  }

  /// Register the device into user plants
  ///
  /// Check if the register id is exist in [devices] collection or not.
  /// if not return false, otherwise add the device id into user plants
  /// when this method called, it is ensured that [currentUser] in [AuthProvider]
  /// is not null
  Future<bool> registerDevice(DeviceRegistModel deviceRegistModel) async {
    await Future.delayed(const Duration(seconds: 1));

    if (_authenticationProvider.currentUserDocId == null) {
      log("---------------------------------------------------");
      log("On File: user_plants.view_model.dart: regusterDevice()");
      log("Can't register the deivce: User hasn't logged in yet");
      log("---------------------------------------------------");
      return false;
    }

    DocumentReference<DeviceDataModel> docRef = _firestore
        .collection(FirebaseCollectionPath.fireStorePath.devices)
        .doc(deviceRegistModel.deviceId)
        .withConverter(
          fromFirestore: DeviceDataModel.fromFirestore,
          toFirestore: (value, options) =>
              DeviceDataModel("", []).toFirestore(),
        );
    DocumentSnapshot<DeviceDataModel> deviceDocSnapshot = await docRef.get();

    // check if this device id exist on [devices] collection.
    if (deviceDocSnapshot.exists) {
      log("---------------------------------------------------");
      log("The device Id is exist on devices collection.");

      // register athe image path and get registered url on firebase
      Reference imageFolderRef = _cloudStorage
          .ref()
          .child(FirebaseCollectionPath.cloudStorage.plantImages)
          .child(
              "${_authenticationProvider.user!.uid}-${deviceRegistModel.plantName}.png");

      // Actual uploading the file to the path
      // FIXME: adjust the path of default image to be absolute path
      await imageFolderRef.putFile(deviceRegistModel.imageFile);

      // Get the URL
      String imageUrlCloudStorage = await imageFolderRef.getDownloadURL();

      // fetch user data from Firestore
      log("Update ID: ${_authenticationProvider.currentUserDocId!}");
      DocumentReference<UserDataModel> userDataDocRef = _firestore
          .collection(FirebaseCollectionPath.fireStorePath.users)
          .doc(_authenticationProvider.currentUserDocId!)
          .withConverter(
            fromFirestore: UserDataModel.fromFirestore,
            toFirestore: (value, options) =>
                UserDataModel("", "", "", "", []).toFirestore(),
          );
      DocumentSnapshot<UserDataModel> userDataDocSnapshot =
          await userDataDocRef.get();

      // Add the new device reference to user devices
      UserDataModel? updatedUserDataModel = userDataDocSnapshot.data();

      log("Add View Model");
      log("Current ${updatedUserDataModel.toString()}");

      List<Device>? currentDevicesList = updatedUserDataModel?.devices;

      log("Current Devices List: $currentDevicesList");

      currentDevicesList?.add(Device(
        deviceRegistModel.deviceId,
        imageUrlCloudStorage,
        deviceRegistModel.addedAt,
        deviceRegistModel.plantName,
      ));

      log("After Devices ListL $currentDevicesList");
      log("After ${updatedUserDataModel.toString()}");

      // set the doc with updated data
      // userDataDocRef.set(updatedUserDataModel!);
      await userDataDocRef.update({
        "devices": FieldValue.arrayUnion(
            updatedUserDataModel!.devices!.map((e) => e.toJson()).toList()),
      });

      // Notify the [PlantsGrid] to re fetch data again
      _userDevicesProvider.reFetchDevices();

      log("The new device has been added to user devices List\n");
      log("---------------------------------------------------");
      return true;
    }

    log("---------------------------------------------------");
    log("The device Id is NOT exist on devices collection");
    log("Reject device registration\n");
    log("---------------------------------------------------");

    return false;
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
