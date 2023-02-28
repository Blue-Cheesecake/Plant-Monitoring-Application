import 'dart:io';

class DeviceRegistModel {
  String deviceId = "";
  String plantName = "";
  DateTime? addedAt;

  // Default image
  File imageFile = File("assets/images/default_plant.jpg");

  /// The final form of [DeviceRegistModel] using in View Model
  ///
  /// It just change the [addedAt] to be current data time.
  /// Use this method instead of [this] object
  DeviceRegistModel finalize() {
    addedAt = DateTime.now();
    return this;
  }

  @override
  String toString() {
    return "Device Id: $deviceId, Plant Name: $plantName, AddedAt: $addedAt, File Path: ${imageFile.path}";
  }
}
