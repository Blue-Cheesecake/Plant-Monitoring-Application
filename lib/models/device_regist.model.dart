import 'dart:io';

import 'package:wireless_project/utils/constants/firebase_collection_path.constant.dart';

class DeviceRegistModel {
  String deviceId = "";
  String plantName = "";
  DateTime? addedAt;

  // Default image from storage
  File? imageFile;

  /// The final form of [DeviceRegistModel] using in View Model
  ///
  /// It just change the [addedAt] to be current data time.
  /// Use this method instead of [this] object
  DeviceRegistModel finalize() {
    addedAt = DateTime.now();
    imageFile = imageFile ??
        File(FirebaseCollectionPath.cloudStorage.defaultPlantImage);
    return this;
  }

  @override
  String toString() {
    return "Device Id: $deviceId, Plant Name: $plantName, AddedAt: $addedAt, File Path: ${imageFile?.path}";
  }
}
