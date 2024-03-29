import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  final String? email;
  final String? fullname;
  final String? gender;
  final String? username;
  // ignore: library_private_types_in_public_api
  final List<Device>? devices;

  UserDataModel(
      this.email, this.fullname, this.gender, this.username, this.devices);

  factory UserDataModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    Map<String, dynamic>? data = snapshot.data();
    dynamic devices = data?['devices'];
    return UserDataModel(
      data?['email'],
      data?['fullname'],
      data?['gender'],
      data?['username'],
      devices is Iterable
          ? List<Device>.from(devices.map((e) => Device.fromJson(e)))
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email ?? "",
      'fullname': fullname ?? "",
      'gender': gender ?? "",
      'username': username ?? "",
      'devices': devices ?? [],
    };
  }

  @override
  String toString() {
    return "Email: $email\nDevices: $devices";
  }
}

class Device {
  final String? deviceId;
  final String? imagePath;
  final DateTime? addedAt;
  final String? plantName;

  Device(this.deviceId, this.imagePath, this.addedAt, this.plantName);
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      json['deviceId'],
      json['imagePath'],
      json['addedAt'].toDate(),
      json['plantName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'imagePath': imagePath,
      'addedAt': addedAt != null ? Timestamp.fromDate(addedAt!) : null,
      'plantName': plantName
    };
  }

  @override
  String toString() {
    return "deviceId: $deviceId, Plant Name: $plantName";
  }
}
